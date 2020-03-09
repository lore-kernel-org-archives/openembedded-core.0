Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA6760166;
	Mon,  9 Mar 2020 10:52:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48bZn63XvZz3r;
	Mon,  9 Mar 2020 11:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583751162;
	bh=+TsyudHveR3G2ddkY3wrIVRMvfv9wXYBZuuvdgTyUCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVwWOZbpykdzwJMj5kYvsCoOmLyhENdMxKjBtQDAzuHjFrfreL3lEcDfO/rCpDg33
	p3Pfw7B6gsCOoanaqNnAgdsy2+t5GrLCiSrzqOWlz9Fxm11YeD8NyWhNdFddN77AyE
	RaqZFoV/IE9qlwmaLNS/kvYCgygLHcQ92x/a+SY59db6FOXv7N+8CBsSZBDQRVnPTg
	jQ7Ol61vrLUi24XPBHPyAOG38hOVzYWEaAvBTVsXffy2HSLzhGWmUaboGAhpHr0iJe
	/hHFMpfOEimeRHNTzuIksPJBtCnfXvVssJQnFGv0zeR89kfvHbyhEwvvevUhn4dbjT
	a4GG3R9EzE4eTTMnezlN2DrDvF3+Oq9XFlp8cvu/+yzfzAccHVdjebQaqwTf+H7r8W
	ucMpMsZM0rsHlhXTU2OBDOseEXcEfl8xTDuv3PjMz2pJw408SqzXprO2r85zBwkN4q
	+f2sBIeZfPTKB0lOtboQw15GnY+2DhCTWZHX3L4oVzuM9KifjaXf/zouY86bdwc2Lm
	noG0ozQQui6e6JAgUIdCLf5uADzuZAEjRiTiqRYLXiKna+vXMjbKf57P4YAHU5Cuoh
	kWU+SuNxXxR4EIXvvTxcClxzFNs+ZIVCYurrMH66oUZSj7s0zJx6wWZHjI3y48iBva
	GJI1yIbT9OBWIs4hnQwhZLgc=
Date: Mon, 9 Mar 2020 12:52:40 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200309105240.GA2477@localhost>
References: <f4e3d6a5a638b669dc742fddb14d652f06715d04.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f4e3d6a5a638b669dc742fddb14d652f06715d04.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] buildtools-extended-tarball wrapping builds
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
X-List-Received-Date: Mon, 09 Mar 2020 10:52:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Mar 07, 2020 at 04:17:28PM +0000, Richard Purdie wrote:
>...
> This does mean we could drop gcc 4.8/4.9 support if we wanted to and
> rely on the tarball support for centos7/debian8.
>...

Debian 8
- will have LTS support ending at the end of June, and
- ships Python 3.4, which is no longer supported by bitbake.

3 months ago Yocto master stopped working on Debian 8,
and as expected noone complained.

> Cheers,
> 
> Richard

cu
Adrian

