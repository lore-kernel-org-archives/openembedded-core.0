Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1SY1f6-0003iz-0m
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 23:03:20 +0200
Received: by ggnp4 with SMTP id p4so1243270ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 13:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=L3hag2gasLrgQ3OOurDAFmHaVj/OGg+GNX7nfpT1Ye8=;
	b=SVSx96eQhVG1K0gVIruTpQh7b4WRE5qxSLK7JMfpPtbz5JMTLSS3zyQALyzM2OusKi
	Hgqo4TX3FL56vMMsLMBdy4hVydnZyh9raNHPpF76xTfZ3Avvebx6HAJtXrIf9DTbcqBg
	8al3tFJRs1/FgQjpwdyR0N91+S0XdPJ+MJOch22NhclspCONjO+Z7J6KOW3pL9Rx8Rxt
	3UVWLSUFQUd4r/7fBhAk5EP0j9fTItsMPcu4Gm4OyDe6ocMakkD4iFV1fl9mx6z4mndk
	yGMRbzyTjBqch+cLv/iVMTbRW6RqHXT/Jv8ol4UaPqLSeEuacsPCK92zqk+F6MKewJqR
	7iGw==
MIME-Version: 1.0
Received: by 10.50.157.194 with SMTP id wo2mr129916igb.72.1337979170694; Fri,
	25 May 2012 13:52:50 -0700 (PDT)
Received: by 10.231.158.7 with HTTP; Fri, 25 May 2012 13:52:50 -0700 (PDT)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <4FBFEBE2.9080905@windriver.com>
References: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
	<4FBFEBE2.9080905@windriver.com>
Date: Fri, 25 May 2012 16:52:50 -0400
Message-ID: <CA+b4E8z15092kNF7r=yQiRncNKDnVDZqB5_YqAe_5YRn=kBFPQ@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlcqWV1Mu8ENF1TIPP0+du8InwWpB5Hz+XHjmdvFF5jmtjFeHlcb4e4vfpU/bT8U2UDoKBM
Subject: Re: /sbin/init not found in oe-core
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
X-List-Received-Date: Fri, 25 May 2012 21:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 25, 2012 at 4:30 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:

>> Has the boot process changed? What should I be doing instead of
>> calling /sbin/init?
>
>
> You should check your new rootfs. =A0is there anything called init on it,=
 even
> in a different directory?

So far as I can tell, there is no file named init in the filesystem.

> Are you using meta-oe and systemd?

meta-oe: yes
systemd: only if it is enabled by default, so I don't think so. I can
still see /etc/rc[0-5].d, so I think that means Sys V is still in
place.

>
> You should have some type of an init in the new filesystem.. if not, then
> something is wrong with your image and you'll need to diagnose that first=
.

Sounds like I have something amiss with my filesystem.

Is there a way to tell which package previously generated /sbin/init,
so I can see whether it has changed?

Regards,
Brandon


