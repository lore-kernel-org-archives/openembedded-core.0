Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D048873216
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 13:51:46 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so90673541ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cVFkV3ZRJqwl3tHqTrD+Gtm4tmgN3/hY07Dh0pTNeT4=;
	b=Zrga5Ir7FKJcO542eTSgjhftRu/3OIposIuLzHsRwa0slEV+Kni4ntjJxnu0nzksh/
	3DeccnZmOJfMosMrYzROD78T3DD2JTuXHV1rwmVnuNOgsdocklTDeP4UaO3zGcB+LzzF
	XaaMYw4newCAFOH6ezynB+yN95OXilAwthRiUEsk3iRQWVaSqKOQ/E1KVzAhTd+XievK
	qqrKS98L8D1M8EMgpGgGc0B1NV2E8O23k7lkmt93K2kBbuQwrjk4ziVSugEFhb9+hwrc
	mxwj/OL32R59aIMH1Xb1syhcUaMG3+RemvOyzfhy5bSwFllDQwCHbeZJveeaionf0dLz
	9heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cVFkV3ZRJqwl3tHqTrD+Gtm4tmgN3/hY07Dh0pTNeT4=;
	b=VjGCeGC6isSwhv63sH1P4KZwmbPEuzS1VAhM0jL15RPkHCwpdkA018BCXoqwGmpTPa
	KYWIeEPTJU2j1R9glhVE/QIuXRggBck0Yrw+sh0TkvDRxtSTDbdVHu1rYGkPwiS08/Hq
	nXyw6DPW3jYDj+EZ+/7ghm7f1Ke/O+lQIdu7XyN36oSAlm9t/AiIfAK+IRYbmD3f+A89
	414RGi6y0rtN8REq6AD5PYMc9Lm940JBjHS/m6kaac1T3P1Rzm4k3lQn8bMLNgLZKKNx
	R90sDqecRvtQreSBoAf5ctcX/XnwzY5PbC25cjcIFLFr1XEhWfD4gPgu9UOkMohMnJIm
	vKDA==
X-Gm-Message-State: AEkoouv3BV/5exy9lIudA94VU5e8sZ8ZbLEIbD/4G2AnRlJZpjsxjigZEOyPDALMmk8UJMf+z4Y5LLOqNYmcTeyz
X-Received: by 10.36.20.204 with SMTP id 195mr5098628itg.83.1472133107744;
	Thu, 25 Aug 2016 06:51:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 06:51:27 -0700 (PDT)
In-Reply-To: <1472116833486.43456@saabgroup.com>
References: <1472116833486.43456@saabgroup.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 14:51:27 +0100
Message-ID: <CAJTo0Lam5us06i_nJtooYcA3T87nCFjAgZ=Gz_3kh-M0GNHisw@mail.gmail.com>
To: Waldo Mattias <Mattias.Waldo@saabgroup.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Thu, 25 Aug 2016 13:51:49 -0000
Content-Type: multipart/alternative; boundary=001a1143e4e4f31bd2053ae5b262

--001a1143e4e4f31bd2053ae5b262
Content-Type: text/plain; charset=UTF-8

On 25 August 2016 at 10:20, Waldo Mattias <Mattias.Waldo@saabgroup.com>
wrote:

> The absence of certs/signing_key.* in $kerneldir made signing of
> out-of-tree kernel modules fail (silently). Add copying of these files
> during the shared_workdir task.
>

Are you sure that you based this on current master?

Applying: kernel.bbclass: include signing keys when copying files required
for module builds
Using index info to reconstruct a base tree...
M meta/classes/kernel.bbclass
error: patch failed: meta/classes/kernel.bbclass:295
error: meta/classes/kernel.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 kernel.bbclass: include signing keys when copying
files required for module builds

Ross

--001a1143e4e4f31bd2053ae5b262
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 August 2016 at 10:20, Waldo Mattias <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Mattias.Waldo@saabgroup.com" target=3D"_blank">Mattias.Waldo@saabgro=
up.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,20=
4,204);border-left-style:solid;padding-left:1ex"><div id=3D":19x" class=3D"=
">The absence of certs/signing_key.* in $kerneldir made signing of<br>
out-of-tree kernel modules fail (silently). Add copying of these files<br>
during the shared_workdir task.<br></div></blockquote></div><br>Are you sur=
e that you based this on current master?</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">Applying: ker=
nel.bbclass: include signing keys when copying files required for module bu=
ilds</div><div class=3D"gmail_extra">Using index info to reconstruct a base=
 tree...</div><div class=3D"gmail_extra">M<span class=3D"" style=3D"white-s=
pace:pre">	</span>meta/classes/kernel.bbclass</div><div class=3D"gmail_extr=
a">error: patch failed: meta/classes/kernel.bbclass:295</div><div class=3D"=
gmail_extra">error: meta/classes/kernel.bbclass: patch does not apply</div>=
<div class=3D"gmail_extra">error: Did you hand edit your patch?</div><div c=
lass=3D"gmail_extra">It does not apply to blobs recorded in its index.</div=
><div class=3D"gmail_extra">Patch failed at 0001 kernel.bbclass: include si=
gning keys when copying files required for module builds</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1143e4e4f31bd2053ae5b262--
