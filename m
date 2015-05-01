Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8EF73E28
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 17:05:21 +0000 (UTC)
Received: by qcbdu2 with SMTP id du2so4815594qcb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 10:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Sf4lbTSyux+b65CSqkVpiOmHeZnUQSv/sDH6ZOeCb3U=;
	b=Ep4FhYkTfiUtVdBiCJCiqnDoaTTnG4y9U1tOsBJvhiUMEpDRYhspHDxhkDzWg+RIzC
	9QQlvAk7kTGcNQJQhD39jb07Aa6qlpW6aiYA47Ss+1EDC7Hy+4crBZOGL9xCtOP243uf
	0yBFWHcjxRyI2MsRr3eYIF7fSs4Q/bsIEASpc7YG5KfDgDJ8TdmPIBpTqZlcV1am0K19
	5/6Za19//q8OEf4ri0tfGvlf7KstPvD0PtbmGUIZxsstCwIxAOKCZtew3lZkY1TA0W4e
	uMEktBPgWzP8cDY2rEn2uixxJKb67bbLTJ1vQaKKBJ+5tSzKdtRg0vPJVpg8pstjv/6l
	ycbQ==
X-Gm-Message-State: ALoCoQmUqEGxhxbqCpYC+WP+EtHUjo2zEOtiM+CqIU+83/5wnsUvjWi4LLV0uWVZsReWwjZI0w9u
X-Received: by 10.55.50.20 with SMTP id y20mr20908625qky.58.1430499922701;
	Fri, 01 May 2015 10:05:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 1 May 2015 10:05:02 -0700 (PDT)
In-Reply-To: <7bcebaed-2d7e-4769-a014-3a62e81391a0@BL2FFO11FD012.protection.gbl>
References: <7bcebaed-2d7e-4769-a014-3a62e81391a0@BL2FFO11FD012.protection.gbl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 May 2015 18:05:02 +0100
Message-ID: <CAJTo0LYgpxx1VcNJ=4xQ=MFq8DDDkydvs8EekPz8iQ9o8HTiZw@mail.gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libart_lgpl: Allow art_config.h to be generated at compile time
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
X-List-Received-Date: Fri, 01 May 2015 17:05:22 -0000
Content-Type: multipart/alternative; boundary=001a11471392be807d0515083728

--001a11471392be807d0515083728
Content-Type: text/plain; charset=UTF-8

On 29 April 2015 at 08:44, Nathan Rossi <nathan.rossi@xilinx.com> wrote:

> * Remove patch that prevents the Makefile from generating the
>   art_config.h file
> * Remove pre-generated art_config.h for various architecture
> * Add a do_compile prepend to remove the art_config.h that is provided
>   in the source so that the compilation will regenerate the file
>

\o/

Well spotted that this can be removed.

Ross

--001a11471392be807d0515083728
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 April 2015 at 08:44, Nathan Rossi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:nathan.rossi@xilinx.com" target=3D"_blank">nathan.rossi@xilinx.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4nl" class=
=3D"a3s" style=3D"overflow:hidden">* Remove patch that prevents the Makefil=
e from generating the<br>
=C2=A0 art_config.h file<br>
* Remove pre-generated art_config.h for various architecture<br>
* Add a do_compile prepend to remove the art_config.h that is provided<br>
=C2=A0 in the source so that the compilation will regenerate the file</div>=
</blockquote></div><br>\o/</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Well spotted that this can be removed.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11471392be807d0515083728--
