Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDDA7F817
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:53:18 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id t5so23936662ljk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=30VZoOHwMi0JJkZQy+y+bDaAZ1vOjag3nScJjI8MKNU=;
	b=ZcwwA+5nQJLFikHHsthb7HcNnGy4QoJKn4lXz2mLNzsXSUtye0T8NV4alRU6cbWiYl
	dLBXF/8E63mWM9DzRKNDIs15f3bH89KhY0YoMiqclf1WiJcelsj7TDuuD1i5tTAxixA8
	PLsbSixH/LRteOzJAnT4j6pKEzDhw7gRgoBBmPRhUpW/Jvb5rIU9Spv01ucDWT6Rci97
	Y36/hKe/BxfO53beBdnFespLuYQQd1OLnUbFq7bebngC4LUPCG+XCRVPOnEzxHra0iQs
	qnkxjhwUpkQsS2PFfCs+yYl4mAdbSky9ZgsvbWzvFWfpMq33vWlq5Zm8ItVzdTQis0m/
	/y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=30VZoOHwMi0JJkZQy+y+bDaAZ1vOjag3nScJjI8MKNU=;
	b=UvZyI59WPNZh9iqpkGowb++pFDKI/7MYRbviuQfNroV2dU3pAMCmPdeSMzEoSmg9bW
	omR3u3HvKPqvyxKgU67haknM+t2lNhOwugZLh4+7puMjUE8GZIIdDUygReTnbcw5cxDn
	EkUF3RzBP7ua3H0EMoUcCTrqGSjAQxBwqzg9CZkQC9sOjkJ55ESYvCSFF65+XotLD9ha
	SVktFyoGI1zyEzasgnzqArsYk0lUeyjjcx27kG59Z7HSUkta75pKCGYYx6r+8C8BYBZR
	CL44UZSrlxbHuj6LTE+6XAXlYC4MvPAQS8iFhqO1OWUHts65nrxn+2J8KObzq3HPZpNW
	KSHA==
X-Gm-Message-State: APjAAAW/Z3QTvjNA00idx8dbmbGOYhB8WbgG+pde2QTp/nEn78i3vZ0u
	d8dKnVA/P/yKSYtTuMaej3pZRmpw6CzbcjJJVnc=
X-Google-Smtp-Source: APXvYqxiAv2GKcFi/VSo9W6jMHThmPLgaCcdC+YKPqPxC9f2PV/TQQdrFJzLLynFhnm0r5rag4pbwyRAbR/7oVlEz20=
X-Received: by 2002:a2e:575c:: with SMTP id r28mr4478708ljd.245.1574178799609; 
	Tue, 19 Nov 2019 07:53:19 -0800 (PST)
MIME-Version: 1.0
References: <CABPh3UNv+RcyrU8crvf4PAU--s-trBgBYj0-Er5eHan9_Gy6RQ@mail.gmail.com>
	<20191119153722.GG3527@hiutale>
In-Reply-To: <20191119153722.GG3527@hiutale>
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 19 Nov 2019 15:53:08 +0000
Message-ID: <CABPh3UOqsrQd+TQvNbJe8xGrp+eqMV12213=3BHkj6jHMow_oA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Oe-core: python and BBCLASSEXTEND = "native nativesdk"
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
X-List-Received-Date: Tue, 19 Nov 2019 15:53:19 -0000
Content-Type: multipart/alternative; boundary="00000000000029f0ea0597b5107c"

--00000000000029f0ea0597b5107c
Content-Type: text/plain; charset="UTF-8"

Something on the line of:

diff --git a/meta/classes/python3native.bbclass
b/meta/classes/python3native.bbclass
index d98fb4c758..e5bde4a0f1 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -24,3 +24,5 @@ export PYTHONNOUSERSITE = "1"

 # autoconf macros will use their internal default preference otherwise
 export PYTHON
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
diff --git a/meta/classes/pythonnative.bbclass
b/meta/classes/pythonnative.bbclass
index 0e9019d1e2..1fe8d29a14 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -25,3 +25,5 @@ export PYTHONNOUSERSITE = "1"

 # autoconf macros will use their internal default preference otherwise
 export PYTHON
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file

--00000000000029f0ea0597b5107c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Something on the line of:</div><div><br></div><div></=
div><div>diff --git a/meta/classes/python3native.bbclass b/meta/classes/pyt=
hon3native.bbclass<br>index d98fb4c758..e5bde4a0f1 100644<br>--- a/meta/cla=
sses/python3native.bbclass<br>+++ b/meta/classes/python3native.bbclass<br>@=
@ -24,3 +24,5 @@ export PYTHONNOUSERSITE =3D &quot;1&quot;<br>=C2=A0<br>=C2=
=A0# autoconf macros will use their internal default preference otherwise<b=
r>=C2=A0export PYTHON<br>+<br>+BBCLASSEXTEND =3D &quot;native nativesdk&quo=
t;<br>\ No newline at end of file<br>diff --git a/meta/classes/pythonnative=
.bbclass b/meta/classes/pythonnative.bbclass<br>index 0e9019d1e2..1fe8d29a1=
4 100644<br>--- a/meta/classes/pythonnative.bbclass<br>+++ b/meta/classes/p=
ythonnative.bbclass<br>@@ -25,3 +25,5 @@ export PYTHONNOUSERSITE =3D &quot;=
1&quot;<br>=C2=A0<br>=C2=A0# autoconf macros will use their internal defaul=
t preference otherwise<br>=C2=A0export PYTHON<br>+<br>+BBCLASSEXTEND =3D &q=
uot;native nativesdk&quot;<br>\ No newline at end of file</div><div><br></d=
iv></div>

--00000000000029f0ea0597b5107c--
