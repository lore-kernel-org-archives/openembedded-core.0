Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 277A678829
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 10:13:30 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id e195-v6so1461751ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=khROXNE+mleQbxRu1n6NpL47syzpbEnIcig469FU1UM=;
	b=lSQELcoY1kYjioSBpGFZwMBkH13VyqkeR1+WmBpUf4mLlZBpREK1Ul2zxEGJqpDnTp
	WTXJ+rttdo9lPFNa4twbrkGPLKz3ERaE/+f1/8TaghS9VoKcqEOUNXwqC2XPBEG9FS37
	eX1Ba7Gc+3WQsI1roEDnMv2o0OFSMw38ZPTAKXdWqiA0k/X0y8AnGVAxv8X1EBqrsaIK
	OKzx4/mGreSx1YUK/5niBxVPBum3xSEIi+GTGU+3iCX3Vyna8CulBEJAVsP1MotbCf1J
	QdNWY6g4h93uNBiIFRomK8rr/Z4lENdLw+9NNUkqyKdm+UsMTOq1lGHfbkieOS76+aFP
	KIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=khROXNE+mleQbxRu1n6NpL47syzpbEnIcig469FU1UM=;
	b=YK3n5giMnzxm3ATkqxVskipBryND+5QxnBE2llV2niYjpgpoQAzjQVclOyDlGHqOwj
	aZ1kftEkpTBazEwbnF8FEqKIc5vavUh8x/yQjwUn2mjEwQdHEf71Q5VXDBVYs9fkQNiv
	tfWAeBsxT3Rp1eeK92yst+ghSQS5jdmS4wt8t5N+GjiNDDDp0+dWjGX3FquX/N0NvyhD
	6f8+i0JpjqYvbd5w1pap8sjfz0uAshNhwoAfPiUeIuoGzd2O+x/gwnkRx7VaWZyP0PXU
	R/FkV/xwmgvIx4tRnQHOZfDl3KFeaOjKEx0cLhrD0YYNXWr2sRvDJTvh6lbzEP9df2gR
	XhDQ==
X-Gm-Message-State: AElRT7G0xChB0tYRNXprzsia9ODSEPOSC7J+HBJIyMwfh/T4pZZBUY3A
	uwpDI4CFxaqrBMYrErnSKEcECZ1Cp7CKcypzE65yWg==
X-Google-Smtp-Source: AG47ELt/4LsJSfpuzI48q7XqNVpdWQxd+NxJSS5voJP3QER2MLARpyKzLPwj6QgjsNY+Bqew38tYNfenD8owXzupCXE=
X-Received: by 2002:a24:22c2:: with SMTP id
	o185-v6mr1619769ito.60.1521195212191; 
	Fri, 16 Mar 2018 03:13:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 16 Mar 2018 03:13:11 -0700 (PDT)
In-Reply-To: <3dab59e8-c09c-622e-148b-4c8d1ffe2fc9@intel.com>
References: <20180125031227.18327-1-california.l.sullivan@intel.com>
	<3dab59e8-c09c-622e-148b-4c8d1ffe2fc9@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Mar 2018 10:13:11 +0000
Message-ID: <CAJTo0LZHnuZN4u6YUKBM-38QG6ZdDQMawB9x8HWt7w6fgxZ4HQ@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: set HOSTLDFLAGS in KCONFIG_CONFIG_COMMAND
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
X-List-Received-Date: Fri, 16 Mar 2018 10:13:31 -0000
Content-Type: multipart/alternative; boundary="00000000000041ccf0056784dca6"

--00000000000041ccf0056784dca6
Content-Type: text/plain; charset="UTF-8"

Picked to mut, thanks Cal

Ross

On 15 March 2018 at 19:42, Cal Sullivan <california.l.sullivan@intel.com>
wrote:

> Ping. This is still an issue and it looks like this patch fell through the
> cracks!
>
> Thanks,
> Cal
>
>
> On 01/24/2018 07:12 PM, California Sullivan wrote:
>
>> Kernel v4.14 and newer contain the following in their Makefile:
>>
>> HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
>> HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>>
>> This breaks our menuconfig, because it can no longer find ncurses if its
>> not on the host machine. This can be seen in linux-yocto-dev, for
>> example:
>>
>> [clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig
>>
>>    GEN     ./Makefile
>>    HOSTLD  scripts/kconfig/mconf
>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -lncurses
>> /home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -ltinfo
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1
>> make[2]: *** [/home/clsulliv/yocto/poky/build/tmp/work-shared/intel-corei
>> 7-64/kernel-source/Makefile:504: menuconfig] Error 2
>> make[1]: *** [Makefile:146: sub-make] Error 2
>> make: *** [Makefile:24: __sub-make] Error 2
>> Command failed.
>> Press any key to continue...
>>
>> Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our
>> 'make menuconfig' command.
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>   meta/classes/kernel.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 2f6eca382e9..e4df1531c19 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -531,6 +531,8 @@ addtask savedefconfig after do_configure
>>     inherit cml1
>>   +KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
>> +
>>   EXPORT_FUNCTIONS do_compile do_install do_configure
>>     # kernel-base becomes kernel-${KERNEL_VERSION}
>>
>
>

--00000000000041ccf0056784dca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Picked to mut, thanks Cal<div><br></div><div>Ross</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 15 March 20=
18 at 19:42, Cal Sullivan <span dir=3D"ltr">&lt;<a href=3D"mailto:californi=
a.l.sullivan@intel.com" target=3D"_blank">california.l.sullivan@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping. This is still =
an issue and it looks like this patch fell through the cracks!<br>
<br>
Thanks,<br>
Cal<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 01/24/2018 07:12 PM, California Sullivan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Kernel v4.14 and newer contain the following in their Makefile:<br>
<br>
HOST_LFS_LDFLAGS :=3D $(shell getconf LFS_LDFLAGS)<br>
HOSTLDFLAGS=C2=A0 :=3D $(HOST_LFS_LDFLAGS)<br>
<br>
This breaks our menuconfig, because it can no longer find ncurses if its<br=
>
not on the host machine. This can be seen in linux-yocto-dev, for<br>
example:<br>
<br>
[clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig<br>
<br>
=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0./Makefile<br>
=C2=A0 =C2=A0HOSTLD=C2=A0 scripts/kconfig/mconf<br>
/home/clsulliv/yocto/poky/buil<wbr>d/tmp/hosttools/ld: cannot find -lncurse=
s<br>
/home/clsulliv/yocto/poky/buil<wbr>d/tmp/hosttools/ld: cannot find -ltinfo<=
br>
collect2: error: ld returned 1 exit status<br>
make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1<br>
make[2]: *** [/home/clsulliv/yocto/poky/bui<wbr>ld/tmp/work-shared/intel-co=
rei<wbr>7-64/kernel-source/Makefile:<wbr>504: menuconfig] Error 2<br>
make[1]: *** [Makefile:146: sub-make] Error 2<br>
make: *** [Makefile:24: __sub-make] Error 2<br>
Command failed.<br>
Press any key to continue...<br>
<br>
Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our<br>
&#39;make menuconfig&#39; command.<br>
<br>
Signed-off-by: California Sullivan &lt;<a href=3D"mailto:california.l.sulli=
van@intel.com" target=3D"_blank">california.l.sullivan@intel.c<wbr>om</a>&g=
t;<br>
---<br>
=C2=A0 meta/classes/kernel.bbclass | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 2f6eca382e9..e4df1531c19 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -531,6 +531,8 @@ addtask savedefconfig after do_configure<br>
=C2=A0 =C2=A0 inherit cml1<br>
=C2=A0 +KCONFIG_CONFIG_COMMAND_append =3D &quot; HOSTLDFLAGS=3D&#39;${BUILD=
_LDFLAGS}&#39;<wbr>&quot;<br>
+<br>
=C2=A0 EXPORT_FUNCTIONS do_compile do_install do_configure<br>
=C2=A0 =C2=A0 # kernel-base becomes kernel-${KERNEL_VERSION}<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--00000000000041ccf0056784dca6--
