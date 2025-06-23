Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8246FC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:32:40 +0000 (UTC)
Received: from sonic314-13.consmr.mail.bf2.yahoo.com (sonic314-13.consmr.mail.bf2.yahoo.com [74.6.132.123])
 by mx.groups.io with SMTP id smtpd.web11.21295.1750689152449601134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 07:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=nEFra072;
 spf=neutral (domain: yahoo.com, ip: 74.6.132.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1750689151; bh=3BxexQ6FVqKvV0KpYY5WoUIH+cTWCAfCX/9aq85GmNU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=nEFra072/zRTV+nPMCESip9IgpjKr8g+yJlAGbdAJ+9JScqKRRj0g+jOGeOXlGvGwzDdZ9y1BJNiYqhVBhMh8XEomKrObJYTBg2zThIbh83Apr7wS4NDaglZKtGbzQDWIVrLDjIrMHsmRcMZYe+a2OvCmL1BwzGneZNnJKMekuUWLueZQGifaW5rpMi+hQqa7tVa6Uq4hKA9ojxeqk6vtoruAbnmFb8FfKGFGIo5/efDOOeQ13z/oiy/KD/fxR8Ol1/FMyi9ARy33CJxSNV2cr8rkjPCFQXsydCNFcw6y18p4U4zj4id+IzjWMXn3GlZu/Gn1L2TNfWGx2uxpWaXBA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1750689151; bh=tgz8yBBQ1EY4MfVduHnFBW0SmAYgpCSMpoVdwYDKEgH=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=FWuAoWjNfEyZwaSA3fZHdWUgTRl/TyxJW+Yv3lByhJfkKN0sv1+fnf1Imze/4IZMKEQIo3+cq5+S9ONx9gnkw7h+iOsq08O5UlyXPLN2dImRUWXDjr2c3958eIDGsEAEF0rgZ3CTPJE2xAtzq9MYm7B11v5DZW+jPQhO0Aa8vEvMi2GtK3OJg8z+mrAi3ff7/0+2QtF83shMGpvGTn/jwlYqKQDg/ThPUb8fEXCSG2+4E6uC7oRhHWhVUEeALRXxojWOGsjp50YKOO0Nl5cF5G4B6+WvkNugVefvAYft++SCbTDZ9KrveB9MHP5S3WaX9X/yGhMQm/XUIDNEba0HxQ==
X-YMail-OSG: TgEhS1wVM1nUzliisI8zPHL4F0bOiRpE0cu50WHQcuSLcBpyrQ0f06G_tDOxzYo
 hLl_zMislg5R_17042Ya1RkKIxHbgl7O0gLgxYA7w.3og1xjz.aOcqod0rmOs6KPfZ1ieBqCkWlC
 r_dIMNoPXx_bd0LV9iTIfTCSDjoGc9vQ9u818et5o9kn_Pa9X8tiLKfD_954C5vqr.xAxJoGlcN3
 c5tio.9ploEaHo1qq6.erPMqflm9gkbIKTASBVG0sY_YuWRF_NhZHg5meSuXSYvPogIWBtKEl5Q3
 LQ9BhN5rYx9SLSdturtseIhS88W1ajnLmjW5HEyguw12T18mRWoHYGhBf0NsZWBoJr8ZC0Y4iCtX
 4fl1ZyegzXIajibzKOnLSN4LPNcIxqOJESxZPQzrrwwLF8fczdF5SNFManvaNJB4wgOgg9C9NDgZ
 uab8cUa7HrKKwiWv5.iK5P3T5fHe0eX8OPfiKWM.sJPHuM6vQofIV7Y8hi8h6ZYLBtIi0o9wKVpw
 Z9u4_08vrOi6cWN5lxLL5PzGw9g_nbyrAE2x0uf0vgaZ7sxEuSis2x5QoAS1a1scnLWP_Uqg8Xha
 q9ykIDdWiWvUPspYPhGc_.BV33hqwbkQY.98thn6d_c42.GtvdTfbQO9okFqSKWSqD.WMlbwEGw6
 oeWlxlbAJ.n45uH6_g5hQCKc.d_JDF0JbXsZ3B9YFV6bDPV6gCzjEXjV_hMW0rNCF2U.9PSGvr5Z
 XqCDfD1VFduA0fxb7BjrtHbsIh0bsZ3WkA2G1A91DGQCdUPpw_JgyATh8xaoJ1v7awG4OKcARIgx
 Ut_hce06dVa1HfWD_VqvmgQVi.11v4a7ofo3DHLmmKuBoo0eqghX8HhdCeCLwzVeBZzd_snCH8Ls
 Tqts77aWIJpKhzz8_hzIxxoq3nvfIkBzhGF3D48e66qzjrOgb4yVXf57JdAlqDGfLJ.CBj7HCC5R
 c7Lj3IMu_To1PhWlIchLiRChm0yjXOtgoyKYdVBZq8lnENAIZYW898dkpbgBoFsg71wz4QPoivI8
 L5eG1zBntwDtPauc8CDhBHNnJaeZIkQJ0acLypw0.bfhI9mqwditxEzOiygW.eMMldJ1UTgpV2_l
 5HuFHPi52zttufRVRvTuurZivzVZEUo_LaUjSLb5FOUCGQPVwklQTiZBgRnVlq0PiKUJczMAuLSy
 TQLaMyE_hqdKU4kZkhPjTbliEsyEd0E1uD62TbNDj777IW334YQWMAgXA.sb0ojB2Jyv1KBfpSye
 tj8HwYYzgyvkqg1HhKQtqy1q1rAYYsjjNLD6Yku_vX6EjPQa3XIFoH.Kajd8pD.UdLZ4zGoHRkx_
 jvdFCaTjxxHqVZTM38Q9FASouXyC0NcF9kkMW9HImVjvxOChy1So2rUVLYUbEf6cz5lcBMssArlN
 UIomDOfsZ51u86nX6ViYaMgmgqe1AdBnQpQ.1YBpEm4pTfTkK4JoZNAsX4C9NyRIAHalzws1bvkK
 qJi5ceIvprKGCf2cY8hvyt3iSPcXJaNxtNYNL4VE5qxWGEn6moNSwiZa4eC_IQdNP3m1FIZ3ZVVR
 Gg8VxDGh1KPdqsPy7onY2Rh_WQhseNlE9oUFlGvC7dXzI8fA.UQKOM7Son2gh7Iy8WTYGVr16_7s
 Hm7iDp5CGzc1kT2f964LQLjDuRryyQsoJEU3cpDXqXnv32Kn72w0rZl8lbNP.VH2J3YQ02v8y0yU
 xMD4vwbX2LSKG_Q7zYua8uRwM7P8FjftG_4xz2FYiYy..SMVu1UnDNt7ZU_VzbbtlXQd59CDvCJA
 _TYhx_Z.SplKCIblexN5b8_4UQdbjPjY0Fg3nKNmQL1nE5YThlA22yOAOyFBkcxoiJoNh9Vb86XU
 Y_4DwIXH3Pbmrv8HlWcFHBXVDFJREgsiD78VtfqEl2otWOCjyiAHcqvU4DvQyTH1zUHOJGIqI1Ha
 WW1q4W_jUKKN.9XEd3ZlHH6MZ9Mcg.WI07pm578F3qkC2LZmGM7XX5cYj1aenUII5ZNXTumSTexn
 xaDW4vw0roFlLgIoJIxyL.qPm8A_jg2aXLgXrugKIfh8WqzvbnwrYIztzMdFwHMnMztTX9DW.AoQ
 ZzdclP3KSvpbLgCjSh7L7x9HvuA.ZiikeLEmV8g_3s85rfUer9eJ5p.hYBaNHT6CO6MK0ejAzuyy
 JlWwR25OFKwUwDc_cyOJdJwXgREiFeM0sSeF8Yf4f.QIwifK.6kUarBFvkeqMrJoNAeIbDL3X_Hk
 QhlvT0IhR5O6BLWHOD2Z73kds08wZUUzDnBd_0L2DaWD46S6myxWdBlimNSTcrIg-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 615344a5-aa46-4bab-9603-e0fb499b9f59
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Mon, 23 Jun 2025 14:32:31 +0000
Received: by hermes--production-ir2-858bd4ff7b-mfhj2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 20f339637d035b8a2786252bbbd04535;
          Mon, 23 Jun 2025 14:32:26 +0000 (UTC)
Message-ID: <6c934fec-b9cd-41ae-b351-79d9a5dfe23c@yahoo.com>
Date: Mon, 23 Jun 2025 16:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] host_dmesg_logger: dmesg diff on BuildStarted and
 BuildCompleted
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250610153125.4858-1-gavrosc.ref@yahoo.com>
 <20250610153125.4858-1-gavrosc@yahoo.com>
 <549629c6-7d49-40aa-bae3-0e725534bef4@windriver.com>
Content-Language: en-US
From: Christos Gavros <gavrosc@yahoo.com>
In-Reply-To: <549629c6-7d49-40aa-bae3-0e725534bef4@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24027 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219214


On 2025-06-18 21:40, Randy MacLeod wrote:
> On 2025-06-10 11:31 a.m., Christos Gavros wrote:
>> This class is used to capture the host dmesg output
>> when BuildStarted and BuildCompleted. Then computes
>> a diff and prints the result.
>
> I'd like to see a few words about when this is expected to be useful
> and what the drawbacks are.
>
> In the bug Alex said:
>
>    For debugging purposes, it would be nice to record the host dmesg 
> at the start of bitbake and the end of the build to be able to do a diff.
>    This would probably uncover interesting failures that are currently 
> hidden/ignored by the underlying build system.
>    We know there are gcc/ld segfaults and sometime qemu segfaults.
>
> The obvious downside (to most people) is that it will capture 
> unrelated dmesg output should
> the build be running on a shared machine and that some distro limit 
> dmesg usage to root/sudo.
>
i will extend the description of the class and send v2.


>
> Also please mention usage:
>
> To enable dmesg logging add the following to your local.conf:
>
> INHERIT += "host_dmesg_logger"
>
>
i will extend the description of the class and send v2.
>
> Now that I type that, it's really a host_dmesg_diff_logger but maybe 
> we don't care.
>
I kept the name that Richard suggested in the mail.


>
> I didn't actually try it yet ... but LGTM other than the comments 
> above and some whitespace issue
> mentioned below.
>
> Thanks for the patch Christos!
>
I will fix them in v2


>
> ../Randy
>
>
>> Fixes [YOCTO #15557]
>>
>> CC: Yoann Congal<yoann.congal@smile.fr>
>> CC: Randy MacLeod<randy.macleod@windriver.com>
>> CC: Alexandre Belloni<alexandre.belloni@bootlin.com>
>> Signed-off-by: Christos Gavros<gavrosc@yahoo.com>
>> ---
>>   meta/classes-global/host_dmesg_logger.bbclass | 86 +++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>   create mode 100644 meta/classes-global/host_dmesg_logger.bbclass
>>
>> diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/classes-global/host_dmesg_logger.bbclass
>> new file mode 100644
>> index 0000000000..0caf5f0612
>> --- /dev/null
>> +++ b/meta/classes-global/host_dmesg_logger.bbclass
>> @@ -0,0 +1,86 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +# This class captures the host's dmesg output at the start and completion of a build.
>> +# It stores these outputs in a variable and upon build completion, computes a diff between
>> +# the two logs to detect any changes that occurred during the build process. It prints the diff
>> +# using bb.warn(). The user needs to have privileges to run dmesg.
>> +
>> +def append_log(msg, d):
>> +    """
>> +    Appends a log message to variable '_dmesg_log'
>> +    """
>> +    current_log = d.getVar('_dmesg_log') or ''
>> +    current_log += msg + '\n'
>> +    d.setVar('_dmesg_log', current_log)
>> +
>> +def capture_dmesg():
>> +    """
>> +    Returns the current output of dmesg command
>> +    """
>> +    import subprocess
>> +
>> +    try:
>> +        result = subprocess.run(['dmesg'], capture_output=True, text=True, check=False)
>> +        if result.returncode != 0:
>> +            return f"Error running dmesg: {result.stderr.strip()}"
>> +        return result.stdout
>> +    except Exception as e:
>> +        return f"Exception running dmesg: {str(e)}"
>> +
>> +
>> +addhandler hostdmesglogger_eventhandler
>> +python hostdmesglogger_eventhandler() {
>> +    import difflib
>> +
>> +    start_marker = "=== BuildStarted dmesg ==="
>> +    end_marker = "=== BuildCompleted dmesg ==="
>> +    diff_marker = "=== dmesg diff ==="
>> +
>> +    # execute dmesg when BuildStarted event is fired
>> +    if isinstance(e, bb.event.BuildStarted):
>> +        dmesg_output = capture_dmesg()
>> +        if dmesg_output.startswith("Error running dmesg:") or dmesg_output.startswith("Exception running dmesg:"):
>> +            bb.warn(dmesg_output)
>> +        else:
>> +            append_log(start_marker, d)
>> +            append_log(dmesg_output, d)
>> +
>> +    # execute dmesg when BuildCompleted event is fired
>> +    if isinstance(e, bb.event.BuildCompleted):
>> +        dmesg_output = capture_dmesg()
>> +        if dmesg_output.startswith("Error running dmesg:") or dmesg_output.startswith("Exception running dmesg:"):
>> +            bb.warn(dmesg_output)
>> +        else:
>> +            append_log(end_marker, d)
>> +            append_log(dmesg_output, d)
>> +
>> +        content = d.getVar('_dmesg_log') or ''
>> +        if start_marker in content and end_marker in content:
>> +            start_dmesg = content.split(start_marker)[1].split(end_marker)[0]
>> +            end_dmesg = content.split(end_marker)[1]
>> +
>> +            start_lines = start_dmesg.strip().splitlines()
>> +            end_lines = end_dmesg.strip().splitlines()
>> +
>> +            # generating diff between BuildStarted and BuildCompleted dmesg outputs
>> +            diff = list(difflib.unified_diff(
>> +                start_lines, end_lines,
>> +                fromfile='dmesg_start',
>> +                tofile='dmesg_end',
>> +                lineterm=''
> Add spaces around "=" ?
>> +            ))
>> +
>> +            append_log(diff_marker, d)
>> +            if diff:
>> +                for line in diff:
>> +                    bb.warn(line)
>> +            else:
>> +                bb.warn("No differences in dmesg output.")
>> +        else:
>> +            bb.warn("Could not find both dmesg sections for diff.")
>> +}
>> +hostdmesglogger_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

