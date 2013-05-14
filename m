Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UcHgT-0002Mk-5R
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 18:02:48 +0200
Received: by mail-ve0-f174.google.com with SMTP id db10so806208veb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:content-type;
	bh=XconRwgpeaWWUZXowthmY3SYBgkMYrjdimv/Efso40U=;
	b=eeHIj1ouHgXLKSyGgjnxN8LugGF+9EOVsjM2odoia47AVK0gcfEz+GLUDyDAJ+fRrf
	8PmfbIG/mA3U/tQXCcbnF8LSwxQz/A30nlKnNO09gVjCYQfa+7RUnoz8CPCML/rDEnZ2
	LHKGk4gHU2xpgqY039YekRoLk8Hz1463XdCd3rX6EpVRLPDnDTdwu+VGRqJwn9KNVSvO
	HB38c+p4mPGVnQ6+w3vjtO3db8FIFk1mNcnUHfuocw7EAE44UeK8CLdLrgI03NZM4gC4
	4kxP58DfKf7L/Vf8xuSRzD8IwwyTq4+uxOZXfravwWXWvnaqQH4Tr8D7czH74jisGZpf
	o3PQ==
X-Received: by 10.52.172.73 with SMTP id ba9mr19490807vdc.16.1368546265421;
	Tue, 14 May 2013 08:44:25 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Tue, 14 May 2013 08:44:05 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 14 May 2013 16:44:05 +0100
X-Google-Sender-Auth: AaqPN79RAB3_F3w2g2QMWdvtPVw
Message-ID: <CANyK_8dNzcm8-FCkS1CCkow4FK5kjHfug3gvMviqw=WFWigT_A@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: LICENSE still references poky
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
X-List-Received-Date: Tue, 14 May 2013 16:02:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just looked at picking up the MIT license file from openembedded-core
to use in my own layer and noticed that it's still referencing poky
and bitbake as a subdirectory not as a separate repository (see
http://git.openembedded.org/openembedded-core/tree/LICENSE). Is this
right or should it be changed? Don't think it's something I can write
a patch for myself as I'm not 100% sure what the content should be.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


