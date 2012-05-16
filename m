Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUjSV-00040L-HW
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 21:00:27 +0200
Received: by wgbdr1 with SMTP id dr1so939607wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 11:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3oWBjWsr4M0yGS3uKIgD0J7BlK9u+ShjeubA7Fm2s80=;
	b=MluXxAwIpX+BQohLnUXL81fbxAnIIYzZUexRNZFBVxNfY60PNk2Mtn+DjH2JZW9zmu
	8ugH2FzzV8JymacP0aEeloWAijQ3hLmDs5BTuG7W8Ic4Zntlpe0YS9/+dFvqR+67RzGx
	/4CyI7X1s5hzNbpmYLBO2uw3kZNm5ZROT78pyZZQ2uS7FvDCbY3qgVgisDs4Oi7Apelm
	H9Qso0R4aAJ+xqaqqBP61jorRB+7jS5oX6cK8bn/tH4f/OtafFSKumaJcRwnYbZ+8pc0
	HbyM2yNJch7I07tOyFvdZd4azS4ESBDidmYTixnn4HJF7d73efA7IqybRqHTtkOXjeTJ
	uvFQ==
Received: by 10.180.97.3 with SMTP id dw3mr43108588wib.19.1337194225605;
	Wed, 16 May 2012 11:50:25 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h8sm11730746wix.4.2012.05.16.11.50.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 11:50:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FB3F434.2040703@opendreambox.org>
Date: Wed, 16 May 2012 20:50:21 +0200
Message-Id: <06EC3C03-3054-456C-96C2-4A21604BEE05@dominion.thruhere.net>
References: <1337187331-4945-1-git-send-email-obi@opendreambox.org>
	<89109968-DC24-477E-9E9D-2F255D1EB93B@dominion.thruhere.net>
	<4FB3F434.2040703@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl+AGZoL2uuGo3+4FAbtgRtgk3e4KIW8qwOXyVCJcxyRrpkQbKlI32y8S7VSfZkhdjVYDeF
Subject: Re: [PATCH] avahi-systemd: drop postrm, use prerm instead
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
X-List-Received-Date: Wed, 16 May 2012 19:00:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2012, om 20:38 heeft Andreas Oberritter het volgende =
geschreven:

> On 16.05.2012 19:17, Koen Kooi wrote:
>>=20
>> Op 16 mei 2012, om 18:55 heeft Andreas Oberritter het volgende =
geschreven:
>>=20
>>> * Calling "systemctl disable" from postrm is too late and
>>> causes the following error:
>>>=20
>>> | Failed to issue method call: No such file or directory
>>>=20
>>> * Fix indentation of prerm for resulting shell snippet.
>>> * Messing with $D is not needed in *rm scripts.
>>=20
>> It very much is, you can offline remove scripts just like you can =
install them.
>=20
> What's the use case for removing packages offline

e.g. BAD_RECOMMENDATIONS

> and where in OE is
> this used? Is the majority of prerm- and postrm-scripts prepared for =
that?

Dunno if the majority is, but you're now actively making it worse.=


