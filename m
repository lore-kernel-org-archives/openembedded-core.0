Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 632636E660
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 03:43:49 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id E78AEC4E04
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 22:43:49 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2016 22:43:49 -0500
Message-ID: <47AE4E78-D57B-44C1-B5D5-4509B15AD3BC@seebs.net>
In-Reply-To: <579FFCEB.6090200@windriver.com>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
	<BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
	<1470092106.9142.113.camel@linuxfoundation.org>
	<579FFCEB.6090200@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.4r5234)
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 02 Aug 2016 03:43:51 -0000
Content-Type: text/plain; format=flowed

On 1 Aug 2016, at 20:52, Robert Yang wrote:

> And when remove file2, but file1's permission is changed, it should
> be considered as a bug.

I'm not sure of that. My interpretation would be that hard linking under 
pseudo to files which weren't created under the same pseudo database is
user error; that's not how the database is intended to work. That said, 
it's pretty trivial to add the things to it.

Although I'd like to know more about the use cases for these, because it
occurs to me that the qualifier "same pseudo database" points out 
another
possible failure mode: Would any of those files that are being linked to
be getting linked to from *more than one* pseudo database? Because if 
they were, that would be a thing I haven't been planning for and I don't 
know
whether it'd work sanely.

-s

