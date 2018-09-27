Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id BC56A79707;
	Thu, 27 Sep 2018 20:59:14 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id k64-v6so3411619oia.13;
	Thu, 27 Sep 2018 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=75/KIYZ+wT5oTVv53FOAWfBJbJF2lxxVXk94XASuxYo=;
	b=AYrif/MNPFo8DdwD6GtSJOQGeXUEJo9jkkz2NCaoC7MBcH6QT7kn1RXO3wTtI9OE+t
	1MOB4e3RsEaKo75PvW9g4WwrXcJpw9Rf6aa7i3EFo8iJ6z+UgcGeQUyf8OYn6ppVetzI
	MkIlQp9QTEaPdM7W3fZC/d0rptmdLBmiYbL+QF90Bx9PjpYXztYaSn5XYlyb4Mb13so1
	hREwS9Tq5NvfOSTBLOSTeEXyn/lGlsNeeJOnH1YCz8UgVjPz20ojzuy/fWuwXZE5eNL0
	QoG87rqMYBHkIEQFG6YV/sMcJcFMRDe3Db82qmbNlNJoaGP1Ae8Dimfe1dm3QpR61LQ7
	9qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=75/KIYZ+wT5oTVv53FOAWfBJbJF2lxxVXk94XASuxYo=;
	b=TJEqkrLn+mkVaVAT1Hy0Q9cjRbVsgdRSOF4iENJUuT53jXwa1N/xEy/+m9ixcEeBuh
	5gaiIHq08Rf1XAEvqTZlQmPcvoGXCrPGUvM00ENC08qk6YXONqCVyyD/F/Ob4SdnqOCt
	Rj23ddoZk0P1UQ1nwLfGTId2Y99gK4+D9uKkCdM+G5FVUbfztUudpEcNEe/X9DdZLUtL
	tJekLDKzn8UbpR+JlMheSTvWIZ52jVSubo/MTfymezYBWtbRjhIv2bcrk+eNhEFJWkx3
	GHcQB9tav4HkptVS0nmD+H/kEykYfOxYXgyIbqZ7ASL9klU5xJoSSIZY4e7y8i4TIg4y
	sa0Q==
X-Gm-Message-State: ABuFfojIZHT0s73qryQ4es96Suam25O/NJQtXgTUP/nCNq2TKls4Ramv
	QbfKGof9iiMz8UkuzxHSHRjYIVf5ty5IdMBVP7Q=
X-Google-Smtp-Source: ACcGV60mjsjpkrM33xP5oEt9VHi531DvHK4ecE1AiTE2oV8YFE+0wF4noDqlBw6viWQNsci2bxYOVQDADXklK/c6EYs=
X-Received: by 2002:aca:ed57:: with SMTP id
	l84-v6mr4297268oih.188.1538081955707; 
	Thu, 27 Sep 2018 13:59:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Thu, 27 Sep 2018 13:59:15
	-0700 (PDT)
In-Reply-To: <1721109.tuLG3TFsTU@localhost.localdomain>
References: <1721109.tuLG3TFsTU@localhost.localdomain>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 27 Sep 2018 22:59:15 +0200
Message-ID: <CALbNGRRhGOx7rcZq=kFypcPC=BWoPtimH-oFqpJXfmoT4eHgww@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: layers.openembedded.org upgraded
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
X-List-Received-Date: Thu, 27 Sep 2018 20:59:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2018 at 10:42 PM, Paul Eggleton <paul.eggleton@intel.com> w=
rote:
> Hi all,
>
> I'm very happy to announce that we've finally been able to upgrade the la=
yer
> index at http://layers.openembedded.org to the latest revision on master,
> incorporating quite a bit of work that's been going on for the past few
> months. Improvements now visible:
>
> * Patch tracking - each recipe detail page now lists any patches being ap=
plied
> by the recipe along with upstream status for each - see attached screensh=
ot.
> You can click through to view/download the actual patch, and any URLs in =
the
> supplemental status text are also made into clickable links.
>
> * Source tracking - remote entries in SRC_URI are now listed on the recip=
e
> detail page and made into clickable links where possible - see attached
> screenshot
>
> * Link to inc files - there is now a link in the recipe detail page to an=
y inc
> files that a recipe includes as long as they are in the same directory, a=
s a
> shortcut to see the rest of the definitions for the recipe.
>
> * Recipe list CSV export - there is now an "Export CSV" button at the top=
 of
> the recipe list on the layer detail page. This currently includes the rec=
ipe
> name and version - we could look at extending this, but note that the RES=
T API
> provides access to all of the information programmatically and may be bet=
ter
> suited for many applications that need this data.
>
> * Site-wide notice support - admins can now add notifications to appear a=
t the
> top of the page across the entire site. This is useful in the case where =
there
> is some problem with the update process or maintenance is going on as hap=
pens
> from time to time.
>
> * Bootstrap 3 - the UI has been updated to use Bootstrap 3 from version 2=
 that
> we were using previously. This has made a fairly minor difference to the =
UI
> (padding/spacing/fonts have changed a little) but has allowed us to tidy =
up a
> few things in the code.
>
> * The "Base" layer type is no longer selectable for layer submissions. I
> noticed people sometimes selected this erroneously; it's only applicable =
for
> openembedded-core and meta-oe basically so that they show up at the top o=
f the
> layer list. Only admins can now select this type for a layer.
>
> * Numerous other bugfixes, robustness improvements and code cleanups.
>
> Thanks very much to everyone who has contributed to the layer index code =
up to
> now (and to BitBake / tinfoil, which we rely upon to extract the informat=
ion
> from the metadata), but I'd like to give particular thanks to Michael
> Halstead, Yi Zhao, Konrad Scherer, Robert Yang and An=C3=ADbal Lim=C3=B3n=
 for making
> this upgrade possible.
>
>
> Also integrated were the Recipe Reporting System (RRS) which powers
> http://recipes.yoctoproject.org and other distro comparison support, but =
these
> will take a bit more time to properly enable so I'll send out a separate =
email
> with further details when they are ready.
>
> As always, please let me know if you have any comments or notice any issu=
es.
> (I've already seen a few minor problems in the update logs so I'll be loo=
king
> into those.)
>
> Cheers,
> Paul
>
As daily user of layerindex I think particularly the first three
features are very helpful. Thanks a lot!

Andreas

