Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id B5DBE6A619
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 04:22:53 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so2872714oah.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Li78Q2sAx8guN56HHwWCSbrqFg9T4Zik/Y4F7Fah0xk=;
	b=dp4uawvsL3NSJp+Iu+hF3/Yh0wUX7jpQbiZDwCBU5J98MlE2qB8+VYHZORtrA6iDdb
	al8BV6qFGO5MTsjX+TUQyb9QjQ3XIicv2fDDc3uFK8GGyDo4N7F8bmr4nxbN4CKJRcBz
	GeMI03b9vOn+xEkkiZbWQps28zeCtekNZVsKniRC6tYuVMrwC42DqprTdsTuhJf/MEAx
	Z7yUmdRfh1efXy5JeeF7LKV4UkZBT5eb7aMjvpYivoUWZpI+4CeB3hfZyVfNhVmo4M2o
	ANU1CB1j0yWP9yFsEbC9tEtcw6g/b3qkkCkAh7awuu9ya3TNUri77TnAPXLg4ygj/Chq
	/EWw==
MIME-Version: 1.0
X-Received: by 10.182.101.131 with SMTP id fg3mr10157936obb.11.1370924574362; 
	Mon, 10 Jun 2013 21:22:54 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Mon, 10 Jun 2013 21:22:54 -0700 (PDT)
In-Reply-To: <2342205.5KE7L6LC2a@helios>
References: <CAGDS+nkQ1u=bzhgDGJjMw+U99eazLb_Na51qmVSa2AGUrZM_QQ@mail.gmail.com>
	<2342205.5KE7L6LC2a@helios>
Date: Mon, 10 Jun 2013 21:22:54 -0700
Message-ID: <CAGDS+nntLyno2HmOWLdxFTOoTa+C7_Ko05_33Gv8z7yoekz5AQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Sample recipe for qt4e app?
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
X-List-Received-Date: Tue, 11 Jun 2013 04:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 4:06 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 10 June 2013 15:45:42 Steve Sakoman wrote:
>> Does anyone have a recipe for a simple qt4e app that they would be
>> willing to share?

> It's not really much different; you should only need to inherit qt4e instead of
> qt4x11. As for an example, you could look at the qconnman-e recipe in meta-oe:
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-qt/qconnman

Thanks Paul, that helped a lot!

Steve

