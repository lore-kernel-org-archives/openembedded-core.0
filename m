Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 41DD473DAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:57:59 +0000 (UTC)
Received: by widdi4 with SMTP id di4so102869202wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=HIBcTj4OFxS1v6ichSAkhGp7YgAIuaiP7Q/3gAbPitI=;
	b=EvDYq/Ak271aWhAAwn4s51GaiUZQ8x1X5r/K0VrtB1jF9P4hG7uwLyDO3FoBRLAdjp
	/gsX7JAbRLA6fGidaEm2RnpThW0Us/kOVcfWpB12/O6gkY/fzmYUifvuTap3H/sHgCzD
	XQTlqWXcRFiabethfTtH/F1ByqzJJLOE9+ycYpRpSyo5yg/72nc0gAET4uJEo/gviB5T
	z7GhyA73EB3oy3h4zJ1foontvQNQOVhl7NLQa37WZJ+1LTHR9hIUXMUfrLnSPzxR1jng
	RhZyXQckqgp5awu4ktknsJIthk8GO0bcncRV8DfBX9O9IFJqSHy0YHgTonYW2G0ETWlM
	rPsA==
X-Received: by 10.180.208.99 with SMTP id md3mr21347748wic.34.1430146680063;
	Mon, 27 Apr 2015 07:58:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id f8sm11990195wiy.7.2015.04.27.07.57.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 07:57:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 16:58:55 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150427145855.GH2379@jama>
References: <553DF0CC.4040705@windriver.com>
	<1430143945.13022.120.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1430143945.13022.120.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] remove the subversion_1.6.15.bb
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
X-List-Received-Date: Mon, 27 Apr 2015 14:58:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2015 at 03:12:25PM +0100, Richard Purdie wrote:
> On Mon, 2015-04-27 at 16:18 +0800, Rongqing Li wrote:
> > Hi:
> >=20
> >     there are two version subversion in oe-core, Do we have special
> > need on subversion 1.6.15, if not, I like to remove it
> >=20
> > ./meta/recipes-devtools/subversion/subversion_1.8.13.bb
> > ./meta/recipes-devtools/subversion/subversion_1.6.15.bb
>=20
> They changed the on disk format between 1.6 and 1.7 which is why we kept
> 1.6.x. At this point I personally think it could be removed now though.=
=20
>=20
> CC'ing Martin since I seem to remember he had some interest in this.

Thanks, I also hope that all projects already upgraded their premirror
caches to use new format, so I don't mind 1.6 being removed now.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

