Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6cO-0008Gk-Fk
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:00:28 +0100
Received: by lahd3 with SMTP id d3so1253300lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=NAjC4fcJzMytZmUzScNH49T1JHY7jL4TPrr7KvA/PRE=;
	b=F0YLn5vsaumXAfMtYnmnk2LsGBfk+siqu5LM4Lg2eRWS1lkM2ecSTn1K2pI4nAyfeD
	8O0seYxxevz7rLoJUCay48vosjWA8lsygsRrDA74s0iSWti5+FVKn8o0qMMAUNrauDI1
	xv1AQoCjXqDLx3IuqZZNsZEv9zvMAeiEb817o=
Received: by 10.152.111.136 with SMTP id ii8mr5849698lab.20.1323460414328;
	Fri, 09 Dec 2011 11:53:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:53:02 -0800 (PST)
In-Reply-To: <4EE21138.8070609@emagii.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
	<20111207215306.GE6351@sakrah.homelinux.org>
	<4EE170C6.2070201@emagii.com>
	<1323431158.5309.126.camel@ted> <4EE21138.8070609@emagii.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:53:02 -0800
Message-ID: <CAMKF1spawg-a2JvxHB4h5MbzcpO0O_cnTbwwcsMRCX2r2_qp8Q@mail.gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] Add copyleft compliance class --- MAJOR BREAKAGE!!!!
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
X-List-Received-Date: Fri, 09 Dec 2011 20:00:28 -0000
Content-Type: text/plain; charset=UTF-8

>> Certainly oe-core does continue to work. I hadn't realised there were
>> incompatibilities introduced by this patch :(
>>
>> Not sure what we should do about this at this point, probably fix the
>> layers :/.
>>
> True, question is who and when ?
>

layer maintainers. I think this change deserved an early warning so
layer maintainers
could have buckled up.


