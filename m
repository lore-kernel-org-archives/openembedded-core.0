Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6W6-0007h9-Ac
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:53:58 +0100
Received: by lahd3 with SMTP id d3so1250885lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cvnUOSrxG+f5n5nkWWvurtawh/UR1znZkmcGsMMNJL8=;
	b=yDbvldKC4AgFbqTaTr6Ll5iBdALkR8OCDgtT8tWwFbk7b1cz8M19EfsMjvnjfm6NBj
	OHS7HHvbWbz17CBcSNh/UEWSZ5/Ux50JTCzFXPL4k9pIxOWoMdqnN0ch9d0mck5X+dso
	B427DTA5ke/f6Umz7rPYtDltL8hCTAV7PoSiw=
Received: by 10.152.104.103 with SMTP id gd7mr5731141lab.34.1323460026334;
	Fri, 09 Dec 2011 11:47:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:46:35 -0800 (PST)
In-Reply-To: <4EE25B1E.1060603@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<234071f22c2183ea28cda55bac8f68cb47e8f0e1.1322607016.git.sgw@linux.intel.com>
	<1323456167.25802.5.camel@mattotaupa> <4EE25863.20906@windriver.com>
	<4EE25B1E.1060603@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:46:35 -0800
Message-ID: <CAMKF1sphXzu3HobzjJeXYbCg+w7r3uBJOZT9RwuPvd8jLg3Y=w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/26] xinit: Update to 1.3.1
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
X-List-Received-Date: Fri, 09 Dec 2011 19:53:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2011 at 11:01 AM, Joshua Lock <josh@linux.intel.com> wrote:
>
> Both of which set PR to 0, which I always understood to be 'policy'
> unless there's a reason not to (usually meta-oe compatibility) but each
> have their proponents for what makes most sense.

if PV is screwy i.e. not incremental then you might have to keep PR incrementing
but that should seldom be the case.


