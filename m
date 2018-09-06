Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69C0D79492
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 01:12:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w861CGDL006098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 18:12:16 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 18:12:15 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
	<1536150963-173280-3-git-send-email-hongxu.jia@windriver.com>
	<29c9d4100bb58139048de99ecd6341b440873889.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <0a0d8709-eae7-7952-faae-c541f2c55ba5@windriver.com>
Date: Thu, 6 Sep 2018 09:12:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <29c9d4100bb58139048de99ecd6341b440873889.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/3] prelink: do not use 'exit 0' to incorrectly postpone to first boot
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
X-List-Received-Date: Thu, 06 Sep 2018 01:12:18 -0000
Content-Type: multipart/alternative;
	boundary="------------AB5A556A671A50A6049BB9AC"
Content-Language: en-US

--------------AB5A556A671A50A6049BB9AC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月06日 01:34, Richard Purdie wrote:
>> -
>> -if [ "x$D" != "x" ]; then
>> -  exit 0
>> -fi
>> -
>> +pkg_postinst_ontarget_prelink() {
>>   prelink -a
>>   }
> I'm not sure this is correct. The idea here is that no postinst runs,
> on target or at rootfs time (since we prelink the rootfs elsewhere at
> rootfs time). The only time a postinst runs is if the package is
> actually installed onto a target system later on a running system.
>
> I think you change the behaviour here so that it would run on the
> target system at first boot?

Yes, you are right, since the behavior is on purpose, the fix
is not necessary, please drop it.

> Cheers,
>
> Richard



--------------AB5A556A671A50A6049BB9AC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年09月06日 01:34, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:29c9d4100bb58139048de99ecd6341b440873889.camel@linuxfoundation.org">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">-
-if [ "x$D" != "x" ]; then
-  exit 0
-fi
-
+pkg_postinst_ontarget_prelink() {
 prelink -a
 }
</pre>
      </blockquote>
      <pre wrap="">I'm not sure this is correct. The idea here is that no postinst runs,
on target or at rootfs time (since we prelink the rootfs elsewhere at
rootfs time). The only time a postinst runs is if the package is
actually installed onto a target system later on a running system.

I think you change the behaviour here so that it would run on the
target system at first boot?
</pre>
    </blockquote>
    <br>
    Yes, you are right, since the behavior is on purpose, the fix<br>
    is not necessary, please drop it.<br>
    <br>
    <blockquote type="cite"
cite="mid:29c9d4100bb58139048de99ecd6341b440873889.camel@linuxfoundation.org">
      <pre wrap="">
Cheers,

Richard
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------AB5A556A671A50A6049BB9AC--
