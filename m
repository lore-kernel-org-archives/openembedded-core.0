Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D96526072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 21:04:33 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id c63so77862667iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kq6jA4p8XFDiPVFTeFQIm5zYxhg6XZcUJNynYzg1ZTc=;
	b=o/pDLzLH7XhkB23WpM3LMPZV2Uif1b4VNWBh0C1dc5lR6ugIJtUoym0vqwHuZF1bgz
	XgD8nRxCqb9rGx//IHRN3CgjKdIcbAwMloblGJhhLN6fEiEYH5tFB96ADNeJ0allzhUi
	0ZVQ0iDB04YGUbISb/jOaacKK2yqznrLq9ILlvW/ylvvY9x7PQqD2oW7Ruzgj6Ri+MDg
	oQGN4h6zrrBNuhEpDEjlh0DhLyialyjKYidObKCf9ChwLomYNzyWAjIC6dnTEGNBqj18
	7pQddZCIHTq/ogt4dazC8j3Vn5dgHAHLXfHWrbTZ8sIgb+TwukJL20oDfbVMYZMQnRk3
	gtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kq6jA4p8XFDiPVFTeFQIm5zYxhg6XZcUJNynYzg1ZTc=;
	b=dx7z3nSr+KZnLI0bg1CAuBBpXW6EnPGBuYBRF86hdQE2LIubX131YY3P0nCpBNBbE+
	G1pYskkXiJr/PukDpGArl2gNjeilAsZ60PnqOljRZYJOXcWQpRfR+gC4l+mcjaie1HZE
	5JsJSGKWrKfZ36HrhlMGlfg4JFdgb1Q8Y52l7mr5EP/mMhAP9wLdfoWcW3YCjjKIus0v
	jvmwLrk6u+SgvubA+JVMTFCw0AxTrmyrpnNQjsC/0yjOOONSB299nHGplRVFE6E6coW3
	9O9artdK/pHd+yvngPTfyZqV0Vt/UTcPdMoD3dS6tX8xoxW2bn27Yn7pJd05MiKBXw9h
	6+JQ==
X-Gm-Message-State: AD7BkJLsTudw0QviNelornGZx0GRI4E10Cma3YsL2lp8YdGYT4gsFmONXvcjxHVYFeLbk4A9I7PrdRVswo7nNDpc
X-Received: by 10.50.43.226 with SMTP id z2mr21049036igl.78.1458680674029;
	Tue, 22 Mar 2016 14:04:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Tue, 22 Mar 2016 14:04:13 -0700 (PDT)
In-Reply-To: <2c1e4c9b74ddb6c21ea4485b53eb42b4cf0eceaa.1458657317.git.adrian.ratiu@ni.com>
References: <123f1a18e95c8aea9939e14a537b701de8137737.1458657317.git.adrian.ratiu@ni.com>
	<2c1e4c9b74ddb6c21ea4485b53eb42b4cf0eceaa.1458657317.git.adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 21:04:13 +0000
Message-ID: <CAJTo0LZ2Lw994KWao=3hca5hDtz89xTJOX2L5wZ1PYjTMe=A5Q@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] default-providers.inc: add VIRTUAL-RUNTIME_mountpoint
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
X-List-Received-Date: Tue, 22 Mar 2016 21:04:34 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f46b16ab052ea98f0b

--047d7bfea0f46b16ab052ea98f0b
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 14:49, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> util-linux, sysvinit, and busybox are all capable of providing
> mountpoint; add a VIRTUAL-RUNTIME_mountpoint in order to switch
> runtime dependencies between the three at build time.
>

Is there a good reason to use util-linux's mountpoint over busybox by
default?  If busybox can do it already then we can save a bit of space.

Ross

--047d7bfea0f46b16ab052ea98f0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 14:49, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fr" class=3D=
"a3s" style=3D"overflow:hidden">util-linux, sysvinit, and busybox are all c=
apable of providing<br>
mountpoint; add a VIRTUAL-RUNTIME_mountpoint in order to switch<br>
runtime dependencies between the three at build time.</div></blockquote></d=
iv><br>Is there a good reason to use util-linux&#39;s mountpoint over busyb=
ox by default?=C2=A0 If busybox can do it already then we can save a bit of=
 space.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--047d7bfea0f46b16ab052ea98f0b--
