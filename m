Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 55B17728AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 10:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07A32uu022444; Wed, 7 Jan 2015 10:04:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PLBCRJoW-nuy; Wed,  7 Jan 2015 10:04:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07A3jeF022483
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Jan 2015 10:03:57 GMT
Message-ID: <1420625062.25779.61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 07 Jan 2015 10:04:22 +0000
In-Reply-To: <54ACFD1A.5000606@windriver.com>
References: <1420592855-20473-1-git-send-email-liezhi.yang@windriver.com>
	<1420618033.25779.56.camel@linuxfoundation.org>
	<54ACFB02.5060209@topic.nl> <54ACFD1A.5000606@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] package.bbclass: omit .pyc and .pyo file
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
X-List-Received-Date: Wed, 07 Jan 2015 10:04:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-01-07 at 17:32 +0800, Robert Yang wrote:
> 
> On 01/07/2015 05:23 PM, Mike Looijmans wrote:
> > On 01/07/2015 09:07 AM, Richard Purdie wrote:
> >> On Tue, 2015-01-06 at 17:07 -0800, Robert Yang wrote:
> >>> We should not ship .pyc or .pyo file, but there are a few packages
> >>> ship .pyc, should we:
> >>
> >> Why should we not ship them? Doesn't python create these at runtime if
> >> they're not present? What happens on a read only filesystem?
> >
> > You definitely SHOULD ship the .pyc files. If they don't exist, the interpreter
> > is forced to re-compile the .py source, and will attempt to write the result to
> > the filesystem. It won't cause harm, it won't fail, but it's very inefficient.
> > It's better to let the host do the py->pyc conversion anyway.
> 
> AFAIK, the .pyc is not version compatible, the .pyc created with the
> build host's python may not work with the target python.

I thought that was true for pyo but not pyc? Do you have a pointer to
documentation on that?

Cheers,

Richard


