Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id C4054727B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:19:35 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBIBJKP2004092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Dec 2014 12:19:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418901564;
	bh=nyfWR5c+6AJRiQo04hoI540TDnXwn9mk7gU2ystiEc0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=WDe3pRsMWSuH9uzVYhzbu0F9+9B80ETOS+EacnG7Aln9I37cLwyiKKiV7Zj66+8NU
	544lQQaPRx366719eVG9W6GtqGUBIkjrXU/FEbbqPW4hH0kOalZoqh+f2FR0LWUwQ9
	Q8M3JwJduLKcXGFK9sXS6QZlByjrHvqT99AW7XqI=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBIBJEt3008310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2014 12:19:15 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1Z6v-0004XZ-2c; Thu, 18 Dec 2014 12:19:13 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <548EBDE0.3080704@dresearch-fe.de>
	<lyiohcubq7.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<548FEF09.80304@dresearch-fe.de>
	<1418897346.5106.18.camel@linuxfoundation.org>
Date: Thu, 18 Dec 2014 12:19:12 +0100
In-Reply-To: <1418897346.5106.18.camel@linuxfoundation.org> (Richard Purdie's
	message of "Thu, 18 Dec 2014 10:09:06 +0000")
Message-ID: <ly4mst9pe7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Thu, 18 Dec 2014 11:19:40 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> I had a big subtree from earlier local openSUSE Build Service runs
>> below toplevel /var/run. After deleting this the build succeeds.
>> 
>> But manually deleting such files before running OE builds cannot
>> really be a reasonable solution. :(
>
> Agreed, we need to figure out which tool is suffering issues with
> circular symlinks,

Circular symlinks are not the issue but absolute symlinks (like /tmp ->
/var/tmp due to local changes).  I can not find absolute symlinks to
directories in my images anymore, so Steffen's problem might be caused
by local changes too.

Chroot unaware tools (qemu) are the real problem... 


Enrico

