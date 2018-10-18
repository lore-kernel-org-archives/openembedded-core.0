Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 43FAB79C71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 13:57:00 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id c32so29826949otb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iEOaRr6A+2CkGWjHvw0IAlQRdiQz5PeVSezfAgZ+qnw=;
	b=OmA4YgoptjLYaxT1ibF1VtmclQrJ6diwrauykHUkOwA7/h684bijXbS2WcYTVXaXLM
	+y42rzDqIOK5fvLk11zbdfqhl323lLB7XtQjaJyEvz/n2m39835uc2QppOB7nTAaA42M
	K1oHmUPTHmnEmyYfCVVtdgQRMWU6TIqLY34LLLD/OUP2v2F+htfHpVVOX6DdrycnKXX9
	FioRayqcmn2EDLSxys6pPJe06p+pcScu4xs1CPpaUNcZ4+q5xpydG6rvqRR67g7CUrht
	CqZyt6MyCbNn1XRwjqaXRr+IpdUV/6/ebo6q/+7NiJzSdw6bMFJDP04/iAi5ChPBw/EQ
	poZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iEOaRr6A+2CkGWjHvw0IAlQRdiQz5PeVSezfAgZ+qnw=;
	b=kj6sOKJ31PvQNYnkeRVY7zW28tzmxGiexKRuUiH+we0/etlYZ1ipaflViZvDy3ZxWO
	13BrpEqTU9/bOl4Te7BH5NaVp0O3JByaB/5rBzLhLlaRmDEC4YC+HFfu5RPTrvhbjyzr
	JZV9I7MxjBsQ+HOi6HnNW/mc/seWR4MgESqNoQ2kTULhFpgA2+lXXQ7jNDa7CU2KGzkS
	QRY4H+6NmtCyyUuEA+FRPtTUT+mJsyKr9cCCI9TrMa44anlTkqHMQTVjJLD2t6jpCn06
	UKIzdmLjW3RMwXuc3AY3O/tzjFLHelHfZ8hVaJby0vfFsFuLi35fbkoHvaoJIBJ9JJLI
	etjQ==
X-Gm-Message-State: ABuFfogP6X7zJ7LAedujrKxn6m+fhAfZpsMIrOsTOf6oH2N/4xwAlk5g
	eD4IMeHxFkejJjW5gTTxs5WysSY/a+cvlZz+yfMRKw==
X-Google-Smtp-Source: ACcGV61qEpeNCSti60joUnQKsQF/g5hzTbnQcsUrVJopPNejpaEql8HU51PV/Zxk8Rc1yfB/RElg60FgZknd73dFpmY=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr17673604otg.8.1539871021316; 
	Thu, 18 Oct 2018 06:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR08MB3631013765027F3C7E24415098FF0@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Oct 2018 14:56:49 +0100
Message-ID: <CAJTo0Laa3KT0EBf1EprPyPfZS+TYL+PoXdTpY3=iXiVraiZv1w@mail.gmail.com>
To: Jonathan.Haigh@arm.com
Cc: Jeremy.Johnson@arm.com,
	Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>,
	Hugues.Kamba@arm.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Missing venv module in Python 3
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
X-List-Received-Date: Thu, 18 Oct 2018 13:57:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

venv is packaged in python3-pyvenv.  Patches welcome to get that
installed out of the box.

Ross
On Thu, 18 Oct 2018 at 14:35, Jonathan Haigh <Jonathan.Haigh@arm.com> wrote=
:
>
> Hello,
>
> I have noticed that the venv module is not available with Python 3 in Yoc=
to.
> This is possibly because there is no entry for it in openembedded-core/me=
ta/recipes-devtools/python/python3/python3-manifest.json
>
> Could  you please provide guidance or a fix to make the module available?
>
> Thank you
>
> Jonathan Haigh on behalf of Hugues Kamba
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

