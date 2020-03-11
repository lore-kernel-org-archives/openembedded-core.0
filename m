Return-Path: <bunk@stusta.de>
X-Greylist: delayed 520 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Mar 2020 08:00:17 UTC
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3A84361ADC
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 08:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48ckgD5Zzjzv;
	Wed, 11 Mar 2020 08:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583913097;
	bh=eab7x65BGbcEWu5xEhmFwb2TZxrxFmzPby5MhOUOmvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iz160D0N9LrWASg8NACWmFYtonIOQC9Tb8Akf4oKpSsfopdeTyigDN2tSDAROd2j9
	M609LL1ZWmVEb+2vAfoyZW1EEmWQ6fYB25tHCesusMnhjrxMZHNjIa3CytOa/grj+K
	Pskhl0Kz9XDSbGTXOeYHeagy/y2aaJP6z9in22nkOsCRsSYP2Hhd5WLUuMz+GTAwbc
	YBILx2zMBDjXdkDIZdG9UrrZ+buJqKOQeEaW7Vz3xgS/ENlT0wc3ygNLhNHEzWoXK7
	Lf/WwkvC1Rh0a/uKcC3Uhoant+bTI83RYVWbTcSmaXa2m3CPdOEgtUE/sTTTqxxuqv
	1jd4HGKakfbcMlorlDMngzTZjJi1dzDDI16QAqTfL/7iAht3kueEjLm/7u6qAvrVy3
	b2wttuK9MuwFuXV/HxIOqq0p6Eg9grH936/vEaJwQa3EyYUtCTeDFNPeGplcjoM9M5
	j4l3VRRcP/mEmMfnbIaH5xAGyq+uT6EJNOl+pnyoPk35lT0I8krpoImg2Uxf9x/lWc
	Y3HDf3aO5qsy4zJ/8/ACjLV/T3txhVOqw1P0DZ9wcbXb2YkFqCbtACz7mx/1Y6NWKN
	5cLnY9bnmMVClPGZP/8vy6hHt0PRDvOGpELBqY5OgZG1kZ8CBZWiAXQ9v08L5GtXs+
	YeuqGEPFB+i5rEPvNqU5lj3s=
Date: Wed, 11 Mar 2020 09:51:33 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20200311075133.GA30580@localhost>
References: <cover.1583893499.git.akuster808@gmail.com>
	<350496c3c0b80835cb5311aa6dbc91e4ee7b5935.1583893499.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <350496c3c0b80835cb5311aa6dbc91e4ee7b5935.1583893499.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@openembedded.org
Subject: Re: [zeus 06/16] valgrind: Fix build with -fno-common
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
X-List-Received-Date: Wed, 11 Mar 2020 08:00:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This patch is required for switching to gcc 10 (which changes the 
default to -fno-common) in Yocto 3.2.

AFAIK there is no benefit in backporting it to older releases.

cu
Adrian

