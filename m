Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SU343-0005gb-VF
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 23:44:24 +0200
Received: by eekd49 with SMTP id d49so1498247eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=4dft1s1kCNjROWDQMvd8cechQ+EJTNhLYSyCyxOXsU0=;
	b=KkAURJ/BRRse8ikjzwD2fQy3tWEehRbcRGCJDUugjptvHho8NN88eNGQsHVLihywM/
	i0iN5Al8s1H2uREl1c9jxcjGYWR+Tf3HdpULdOjx70HzLxMGtpvwHoaVYYI4GEErdUGL
	7QNxy8T0/oWJtfoCBhcTGYSZa7bllqY7UbsaltthwBAVZh8VgKEEUjIGnHSjJtjYm8H9
	6keDVXT+v3lxD9spH1saPMQwcSuYR1JzgUx86YPPvqfl+3mo2+Gfcdkgdld2lh523+Hp
	HPAwuOc2UC9CVLXTxUjJAP1HVwUkU+NGabGpRzkK7Z+1a01mv2Ji6zfWb/HBqYHYxBSG
	E8QQ==
Received: by 10.213.115.193 with SMTP id j1mr1794768ebq.141.1337031264785;
	Mon, 14 May 2012 14:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Mon, 14 May 2012 14:33:54 -0700 (PDT)
In-Reply-To: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 May 2012 14:33:54 -0700
Message-ID: <CAMKF1spai-R74dMQZ00FooWwXmyLEdsN0HaPn_SArNPT1=Pa8g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] RFC - CCACHE_DIR to not impact sstate
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
X-List-Received-Date: Mon, 14 May 2012 21:44:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 13, 2012 at 7:28 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> I am not exactly sure how to fix this, so I thought I might ask in the
> form of a working patch. =C2=A0The problem is that I want to use an
> external CCACHE_DIR on some build servers, but use the defaults on
> others. =C2=A0Ultimately the sstate sums should be the same in either cas=
e,

hmmm so how do you ensure that both ccache stashes are exactly same ?


