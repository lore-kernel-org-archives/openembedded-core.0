Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1777B7001D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 00:04:18 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id k204so80822589wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2016 17:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PMP2QKcqNGzawl/sgy3N7+JIaVnEgGbk3Oufo6vM3MA=;
	b=BS1soEGXtCS+7OZPA475Mw0MLglEX3YIV4AmvOIE5Hl9k+ospyd+tsGWk3ReAAJh0L
	HAS1MXezWP4yW19zdlRf8m0QV6zaK9LfuTTM9Do1AR6SjpRGNg/zcx1gUgqTHpnlD0me
	Zo1FGXLi29aaI9pMpt/GzUjDyEF3efleHP4/fJCOyq3NjTMd8MJbDUAsxXt+Xd6D/FpF
	rT7+vsUcoH2nNLGCfsSu96fSxbuwau9i/FyO14BmBdiu+ndkoaAgfrHYvHQqlA1KGCyq
	aIAXTAUjsH99iSWUaUvN+rB8JfQczVNkBoiyVCwPDaSCTkLa3UbGzfRw76Civud1Yz81
	X43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PMP2QKcqNGzawl/sgy3N7+JIaVnEgGbk3Oufo6vM3MA=;
	b=bXHkToMjr8ZhnM2yCCgBSOr3AWFm51S1vrmKwl4OY31bUh6v4+GjB9Inqu1KBNQxdZ
	82WEVvAuE5gv/bG3PoHUPcxA5MUuvTu3FNif7q9VpCn7S93jZnxidfqoaNc/BOF7WI6C
	kWSP0YZrO5EUOv570aQyynd4DdQtC6ohRPLDOm6rK7SneRdPBsWZ83g/HSbezepkyIvR
	KSCP8XyNucEVLjWmnKd1b+cqeXbf0DUaGaDr85ZBNduQn1ywb19PNdeemFMuOUL2MAea
	sraM3v5xVfjkKAJEeI7ptUSXJ2F+62T/qld6dcmAIVtrrckJamPbM7ttEAxbK+qb7dyN
	qyUg==
X-Gm-Message-State: ALyK8tIHbRxP25wkltxrU9M8AmYtIMAnxyyohDvf/LiMFMtDSvWV7NSwwqznJTbbkOZPV6fhuzXwIpGNCFSQfw==
X-Received: by 10.195.17.166 with SMTP id gf6mr11711319wjd.124.1465517058711; 
	Thu, 09 Jun 2016 17:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.44.40 with HTTP; Thu, 9 Jun 2016 17:04:17 -0700 (PDT)
In-Reply-To: <20160609181613.GB2586@jama>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
	<20160609181613.GB2586@jama>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
Date: Thu, 9 Jun 2016 20:04:17 -0400
Message-ID: <CAHPquwPKh0hgOuvHvB0KYVfU0PhtR_sZ8vKO8EgH_YgsZrwtkA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Konstantin Ripak <konstantin.ripak@cogentembedded.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] the fate of Vala in OE
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
X-List-Received-Date: Fri, 10 Jun 2016 00:04:20 -0000
Content-Type: text/plain; charset=UTF-8

I can see that libsecret in oe-core depends on vala though for testing only.

If moving to meta-oe is community's decision, I will prepare the patch.

