Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id ADEA2770EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 10:38:00 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id gy3so51582526igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 03:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NnTBQkreU3s+hfvaagwnXGo/W95EeJlZfp1566qBPpA=;
	b=LawmNPVHX5KEuRISMXk28BTfMALqtF7VhI3SiIzwxK0shinU1U14EQynhKQ36UKNLT
	ESLjHANuLaMr3mRVLidRSdRTQmJEAo5nJFoJAnAF2gOLVGEUusAcA1P2BQTo6HFnOWI6
	ApO57TYTyMqkyikRPMzKC06GAwWEH0/V3zZNfmM146lxE4Mo45oZznLwZ2jG2vtm4SQm
	Q+TJvzx4F3uCkeeqPDyh6NuNR6ftKkj09Lwo9KVz7/fJN1DchJOvFbLL3MBzp83bDB75
	sreby7nIG9Rmv7xPPd8JiXjcHlaAtMkjvCFWIKJQmBwF/+idAsa76JVe/q17eORs4k2h
	O93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NnTBQkreU3s+hfvaagwnXGo/W95EeJlZfp1566qBPpA=;
	b=gTYGydqn0Wg9JBK/+PtSQWcfz2oCLYju49hHDgwB+va5yV8DYhWhdsXrzOPeXkG7q9
	xSRyOQzNSTFpnbV4mxD0BfYQGVS4Vn6TyWhyzmSwaKMv95gwixz+KFff4dfKwnQJvGg8
	PpXbuR4iOOUSbRT7wMrLU+AysCiiuzGUTPDof8a+3KzjSuIYrlLTyOS2yV2gfnCjuoom
	Bnu+t4aJB2ZQgMCqtHZg1zOSXZmLqulQ9L0Qx7FpCw6g7MzTCnFOFb+8wkNuSdeXhOBh
	AmfxmL+PjiLpuMYcpNccN/UXUlMn/ggmFmz+DKSbe1hoc/LxNgNHSJX7KrdnrsdlCRnM
	MS4A==
X-Gm-Message-State: AD7BkJL2VNqSemr9Q5eeVkOLlsqFJnX2+YvPUByglBnFKboQbgcBw/ki+M2vy/YBEaemJVQHJCsJHsPLUITgKvXS
X-Received: by 10.50.155.67 with SMTP id vu3mr14571229igb.52.1459852681181;
	Tue, 05 Apr 2016 03:38:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Tue, 5 Apr 2016 03:37:41 -0700 (PDT)
In-Reply-To: <1459826822-13791-1-git-send-email-Haiqing.Bai@windriver.com>
References: <1459826822-13791-1-git-send-email-Haiqing.Bai@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Apr 2016 11:37:41 +0100
Message-ID: <CAJTo0Lb8AccFHoBfHJXZR0iUtPXEvCzRiUBpadYeDw8cA10QXg@mail.gmail.com>
To: Haiqing Bai <Haiqing.Bai@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Make conditional compile for DES related code in python-m2crypto.
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
X-List-Received-Date: Tue, 05 Apr 2016 10:38:01 -0000
Content-Type: multipart/alternative; boundary=001a1134dbec7cd9fe052fba70aa

--001a1134dbec7cd9fe052fba70aa
Content-Type: text/plain; charset=UTF-8

On 5 April 2016 at 04:27, Haiqing Bai <Haiqing.Bai@windriver.com> wrote:

> +From 85dbf29dcc3786ed101278721d60cc3bc4c182bc Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Fri, 1 Apr 2016 14:44:33 +0800
> +Subject: [PATCH] conditional compile DES related code.
>

Missing Signed-off-by and Upstream-Status.

Ross

--001a1134dbec7cd9fe052fba70aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 April 2016 at 04:27, Haiqing Bai <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Haiqing.Bai@windriver.com" target=3D"_blank">Haiqing.Bai@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7k8" cla=
ss=3D"a3s" style=3D"overflow:hidden">+From 85dbf29dcc3786ed101278721d60cc3b=
c4c182bc Mon Sep 17 00:00:00 2001<br>
+From: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com">Haiqing=
.Bai@windriver.com</a>&gt;<br>
+Date: Fri, 1 Apr 2016 14:44:33 +0800<br>
+Subject: [PATCH] conditional compile DES related code.</div></blockquote><=
/div><br>Missing Signed-off-by and Upstream-Status.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1134dbec7cd9fe052fba70aa--
