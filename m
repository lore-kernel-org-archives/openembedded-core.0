Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9797F77DE5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 17:00:07 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id g204so2802324oib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=s6Zt9ScMpIR9FCbH3I3w9YHGT8emmm2+y63epy5H5cw=;
	b=Dl9KU6q213IdQcpuh6FAl2tOF54oPVQxQHYe+MA7HPCIySDtGf4PkrqO0Gnl3bEnVj
	kGAvuoUGEwwm8Fqbx2D5tLxTEj+wKTt8xz9IRorLK1dfCY2YxkCBPIbAPe3gegMcBMto
	6+6HLo0em61ZY6NglXiOzwwv0eCocWQiQFFBWVKYKjqqtN2XMaSfRUkVDc1szh7ab0Gk
	TNXL5tTAaWpINhWligw9UEOLufd3qro9ZW4H9RUv9d6fGLORFhvGptQm0PbXOj9xALvq
	wl+ni4zPE/ZK3+P+8l9jW/26KlbxC7DYXXhh2iPF66iDJtu+SRkP8M9wYjJd+yS7LA3t
	vhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=s6Zt9ScMpIR9FCbH3I3w9YHGT8emmm2+y63epy5H5cw=;
	b=ihzPUJYcQMYvJpKf9U0ZKVrlXavh2fUgr2aogyLYKo9lOOLf19ZnlgY7YzLUsmePZN
	pUfxWK1gxmvAF9FGAmcjz5qEsUToR8unh7WtGmDOp+eIckfX3Xw7WpbpOGh80CDxghhe
	bKjELG5O87K4LItihzeM49zTham+WDo+seppWqTMdblXRsFX37Ud1PddHyUMWIeQqZNa
	ozY6v64wTwjgg2anlPRLNPkKUf/SSDskcR64MPMa87FKdU/OTgsjX4jYqCouL4cj30ec
	Xt22qfXztKqCjtMK6egGc2pJCjeMQBwLx7Tp0tD7pVzvzHbhEjGUs82ecAf4hytd9J+j
	HMmg==
X-Gm-Message-State: AFeK/H1SWGuqFTk18TciKqMUYlUKvsS7SH7q+SfF2Rq4S2HcfmFPySWQrRiDb3kT4om+FonUoEuMJs3BQ1uuXw==
X-Received: by 10.202.8.7 with SMTP id 7mr21546032oii.68.1491584408461; Fri,
	07 Apr 2017 10:00:08 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.2.34 with HTTP; Fri, 7 Apr 2017 09:59:38 -0700 (PDT)
In-Reply-To: <CAKmqyKM-wvykD1R+nyyCMjictWhLYRuOXYW1wmPPKrtVLyu9hw@mail.gmail.com>
References: <20170324203858.27464-1-alistair.francis@xilinx.com>
	<CAKmqyKM-wvykD1R+nyyCMjictWhLYRuOXYW1wmPPKrtVLyu9hw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 7 Apr 2017 09:59:38 -0700
X-Google-Sender-Auth: Qe2zpe_sytACcPp7kuQmkEUpxoE
Message-ID: <CAKmqyKOBYFdMWK5qG5UWJGRscrjX_c0S3JM6-DLFrwPXx8rXVw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] runqemu: Automatically add a TFTP directory for slirp boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Apr 2017 17:00:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 10:07 AM, Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Mar 24, 2017 at 1:38 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> When booting QEMU with slirp networking we want to use QEMUs TFTP server
>> to make the images in deploy accessible to the guest.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Ping?

Ping^2

I received comments on the second patch, but nothing on this one.

Thanks,

Alistair

>
>> ---
>>  scripts/runqemu | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 23c9efb..f76d976 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -832,7 +832,7 @@ class BaseConfig(object):
>>          self.kernel_cmdline_script += ' ip=dhcp'
>>          # Port mapping
>>          hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
>> -        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
>> +        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
>>          qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>>          # Figure out the port
>>          ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
>> --
>> 2.9.3
>>

