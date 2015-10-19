Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C23E67701C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9JGOYPx018559; Mon, 19 Oct 2015 17:24:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P5JyB-UYHCjB; Mon, 19 Oct 2015 17:24:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9JGOL34018545
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 19 Oct 2015 17:24:33 +0100
Message-ID: <1445271861.17974.123.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Oct 2015 17:24:21 +0100
In-Reply-To: <CAJTo0LZhMs6Pr85oq2H_Tut12yx_f1JEbM+nsWpVOf1UC98ABg@mail.gmail.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LaoQ4yp0AQtdKLQq22Nh=bgKgb4T8ApxyqxUc=U09FLkA@mail.gmail.com>
	<CAJTo0LZhMs6Pr85oq2H_Tut12yx_f1JEbM+nsWpVOf1UC98ABg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bitbake: add file-native to ASSUME_PROVIDED
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
X-List-Received-Date: Mon, 19 Oct 2015 16:24:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-19 at 17:11 +0100, Burton, Ross wrote:
> 
> On 19 October 2015 at 16:37, Burton, Ross <ross.burton@intel.com>
> wrote:
>         Not sure what to do here.  If we install file-native directly
>         into the sysroot we get occasional races on the file binary
>          causing build failures.  If we make file-native
>         ASSUME_PROVIDED then rpm (and subversion) change their
>         behaviour depending on the presence of libmagic-dev on the
>         host (well, rpm4 requires libmagic, rpm5 and subversion change
>         their configuration).
>         
> 
> Two proposals:
> 
> 
> 1) Tell RPM and Subversion to explicitly enable libmagic support so
> they fail if libmagic-dev isn't installed on the host, and document
> that libmagic-dev is a build requirement
> 2) Change file-replacement-native to install libmagic, and add
> file-replacement-native as a dependency to subversion-native and
> rpm-native.
>
> Does anyone have a strong opinion either way?

I tend to become nervous about -dev requirements so whilst ugly, I'm
leaning towards 2) which is what we've done for other similar issues
IIRC.

Cheers,

Richard



