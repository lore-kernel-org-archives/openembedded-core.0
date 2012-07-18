Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SrVoI-00070s-47
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 17:05:06 +0200
Received: by lbol5 with SMTP id l5so2152768lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=OdxMjSzFuXzEw2qGh/GwkhsQJ8cU25VeCygV4YWW6XQ=;
	b=KcQmgoXdRhyhw7qQnZ33uLU18kwKYbCQstU4j+t3jMnh90WeELVRBZaktBjx7GgOxm
	+LGeGgKwLv56qnvDyzoHdUfKSNpd1iGWocT1HjXtRHaUN2mUVDcaamh31CU41+GBmKYJ
	cTFKmOGhpDbFTSJRx8APLEvuwEPYn8G58JpL9/tPtNf4WpKC+KWoIu1h+mCBFZbUidCd
	87h2Q4eFlGAYX7L1G+kDC/8jSoNclVlajKVlGiJ/c3rupEl6dvPrzDbzQyAG/X8BFeOI
	Sy9XfGDmZBRQuFZSpF0pq1hGLuMgDabXQJCNRMVLDR7nmewWdUD9VFaGJHZWNm98/aZe
	r3Zg==
Received: by 10.112.11.38 with SMTP id n6mr1885784lbb.82.1342623225441; Wed,
	18 Jul 2012 07:53:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Wed, 18 Jul 2012 07:53:25 -0700 (PDT)
In-Reply-To: <1342620750-2552-2-git-send-email-ross.burton@intel.com>
References: <1342620750-2552-1-git-send-email-ross.burton@intel.com>
	<1342620750-2552-2-git-send-email-ross.burton@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 18 Jul 2012 07:53:25 -0700
X-Google-Sender-Auth: sdmXFFTMkem3gffyEA9mL4DRez8
Message-ID: <CABcZANknO9Pgp-yDH-p+TEQzPq1fMahgko5X5kP=-qcree=Hjw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: display the parsed PATH/BBPATH when complaining about CWD elements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 15:05:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 18, 2012 at 7:12 AM, Ross Burton <ross.burton@intel.com> wrote:
> Many people don't understand the nuances of PATH/BBPATH, so help them by clarifying
> the warning and displaying the parsed list element-by-element.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Looks good.
-- 
Christopher Larson


