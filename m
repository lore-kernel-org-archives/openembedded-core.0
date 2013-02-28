Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UB8FQ-0000bH-6u
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 19:30:28 +0100
Received: by mail-ie0-f171.google.com with SMTP id 10so2471109ied.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 10:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WOrw/hypapJGB2CqZYgeNHloyMzEvr30P/qs9wK8WDs=;
	b=bng5Qm9oIsk7Bu4NuN3D62FFUQqIIdUWpW9Q3VV1J86ZKNE2eUDoKPndBdK5dR4qBa
	y/HJBGOxZhGLYsOaAcaCN1rnSi4J/0DladRmsOpZcEpxIScQ/zAIfnejNyj4qODwk5+F
	byZjKJ7TI79NTpYPSSx6Rm3T6a+OtlSae9JCkdV7/xd63s4FfyWjn9uFf8fB+BBRghwq
	zt1RjZio3BF8RDJU7pn79pLx4KTuADLX4awCFLTVeI27hzBK2283esPUlGFF+jl+u6vN
	tp1TWfwpTXo36Udpl4aa+LpjYsMXVcEMjCN0k0ZW+fOXtA02bQozir1siaap2c2fIxhS
	d6ZQ==
X-Received: by 10.42.121.14 with SMTP id h14mr3912612icr.27.1362075245338;
	Thu, 28 Feb 2013 10:14:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Thu, 28 Feb 2013 10:13:35 -0800 (PST)
In-Reply-To: <CAHUNapSbpFDttimPKO9czY3NiV4x7kTZ8ysDgq2TuifnosH0Xw@mail.gmail.com>
References: <1362034602-30163-1-git-send-email-raj.khem@gmail.com>
	<CAHUNapSbpFDttimPKO9czY3NiV4x7kTZ8ysDgq2TuifnosH0Xw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2013 10:13:35 -0800
Message-ID: <CAMKF1srnzum61DyhW95LgX14HmOJxaVwvcz_y2iGXNime6FZkg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Fix build with texinfo 5.0+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 18:30:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 28, 2013 at 10:09 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Maybe we should wait until the person who reported this issue has had
> the time to test this fix and confirms it works before submitting it
> for inclusion?

yes thats the intention. Although in retrospect I should have put RFT
in the subject.


