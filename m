Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9682971A72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 10:57:24 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id x49so30785497qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BIXF5ouxc4Uot7CpTS5Qh9NANN7FBjgsT4NZO5V8ICs=;
	b=njKtuT+JeesyWDe08QaF13LL7MnfkYuv4td8DWdjYRyv0OzPNN0iVttcV2sCGDKuqn
	SWT6KLG0daMfQH2aLAeRKYX3f3RzpGu/8z2EM+niLafwLXoQEqAeDiw8kyvszJQqTEq7
	zj38SvEOifgLVIpTlDzNjhoXjtss9uqbulW49RNTzY8AwPQwVsexrRch6eNUqxzTmbm/
	m04m7JUTfdIqekVk9SMoD3iscdJJcBApyAt/7VJyyUW+JyVwOTAnQ0XsmmQR/4fwMDNg
	JGGK74TOsmVH1RN7Xz8XbLf801wbvup0sR43OLzoCWn9yCBD+TieoYPXmaBfGTIO5NbF
	VhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BIXF5ouxc4Uot7CpTS5Qh9NANN7FBjgsT4NZO5V8ICs=;
	b=oKAFopmqJEVJw/3coRT1QTQNEwcA1IlDhw4OOyZ+LN9OsfYyq+cyqr+7RSNJ5BQeDs
	ZCyfcOIH20LlYA0aKfah/Hk4CZCo5rA90Rxc57nF5ZYRRr4+4A4KNiWBlKxZLBrJtKsR
	Wfpbfmp67A8ueiI0wVtSRQrZ0zMRBs8rsN82D+tJ+/+Firx5BZ/VHAPKZIslpRTIlH56
	6FdtvRYVwRwzQl1j01vCPSIy6+cobDgz9DOt7Pt3iP3F/WkFg5artIlFOXlM4Kbg3Cdl
	O0o2fNVzVMbMBo6ZpEcqkn2EKMBpOsqm749UHbhqfDhE5JGqiUMre+8Z2pa9wluxZFFo
	LoAQ==
X-Gm-Message-State: AMke39l9QEcP/Bp/ELoBwu2Imw/0vw+LAx3NErRLZB05NPI83M5vw8MTM7V6lnurBTuehDDxewjwa2Tq0/3tObrB
X-Received: by 10.237.62.232 with SMTP id o37mr7095982qtf.188.1486724245344;
	Fri, 10 Feb 2017 02:57:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 10 Feb 2017 02:57:04 -0800 (PST)
In-Reply-To: <a7a0e642035a2eae2e606dfd54857c1abf11d43a.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
	<a7a0e642035a2eae2e606dfd54857c1abf11d43a.1486622006.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Feb 2017 10:57:04 +0000
Message-ID: <CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Fri, 10 Feb 2017 10:57:25 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e85e90205482af6d6

--001a11406f0e85e90205482af6d6
Content-Type: text/plain; charset=UTF-8

On 9 February 2017 at 06:45, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>

This upgrade is failing all over the autobuilder.  I'm guessing it's due to
this new warning in the configure log:

checking $CC variable... broken
> configure: WARNING: your environment misuses the CC variable to hold
> CFLAGS/CPPFLAGS options


Because later on:

checking for getcwd... no
> checking for getegid... no
> checking for geteuid... no
> checking for getopt... no
> checking for poll... no
> checking for putenv... no
> checking for select... no
> ...
> configure: error: getopt is required for building programs


I'm pretty sure those failures are not accurate!

Ross

--001a11406f0e85e90205482af6d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2017 at 06:45, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:10f" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15a219f563974ac7">Signed-off-by: Hongxu Jia &lt;=
<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt=
;<br></div></blockquote></div><br>This upgrade is failing all over the auto=
builder.=C2=A0 I&#39;m guessing it&#39;s due to this new warning in the con=
figure log:<br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex">checking $CC variable... broken<br>conf=
igure: WARNING: your environment misuses the CC variable to hold CFLAGS/CPP=
FLAGS options</blockquote><br>Because later on:<br><br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">che=
cking for getcwd... no<br>checking for getegid... no<br>checking for geteui=
d... no<br>checking for getopt... no<br>checking for poll... no<br>checking=
 for putenv... no<br>checking for select... no<br>...<br>configure: error: =
getopt is required for building programs</blockquote></div><div class=3D"gm=
ail_extra"><br>I&#39;m pretty sure those failures are not accurate!</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a11406f0e85e90205482af6d6--
