Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B58B865DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4BlNIu010668; Tue, 4 Nov 2014 11:48:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j7Tr7zg1B8in; Tue,  4 Nov 2014 11:48:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bm6PN010726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 4 Nov 2014 11:48:07 GMT
Message-ID: <1415101721.23396.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laszlo Papp <lpapp@kde.org>
Date: Tue, 04 Nov 2014 11:48:41 +0000
In-Reply-To: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
References: <CAOMwXhPbXCQ7ui+J0a8ryekeq5Yy5EXdgt-Qr26Z9w74=vyD5w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Specifying 32 bit dependency for 64 bit software
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
X-List-Received-Date: Tue, 04 Nov 2014 11:49:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-11-03 at 17:29 +0000, Laszlo Papp wrote:
> we have a tool that we run during our make run, but this tool is
> hard-coded for 32 bit. It depends on software like ncurses. I could
> add ncurses-native in an ideal world; no problem.
> 
> The problem is that my host environment is 64 bit currently and it is
> not possible to migrate the whole environment to 32 bit. I am happy to
> explain the details if needed, but I would love you to trust me about
> that. =)
> 
> So, is it possible to say more than just DEPENDS = ncurses-native,
> something like DEPENDS = ncurses-native:x86 or something?

How much of a 32 bit system do you have? Do you at least have a 32 bit
capable compiler and C libraries?

If so, you could use our general class extension mechanism
(BBCLASSEXTEND) to allow 32 bit variants of the native recipes, e.g. a
"native32" form.

Alternatively, a more easier approach would be to build a target like
buildtools-tarball with SDKMACHINE="i686" and then install that onto the
system you're building on.

Cheers,

Richard






