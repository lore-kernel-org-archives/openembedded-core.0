Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEDD770FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14KlQTK026130; Thu, 4 Feb 2016 20:47:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RBGn6iDP6JEd; Thu,  4 Feb 2016 20:47:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14KlLm7026127
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Feb 2016 20:47:22 GMT
Message-ID: <1454618841.27087.244.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	=?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Thu, 04 Feb 2016 20:47:21 +0000
In-Reply-To: <5160543.ahmzsokFdT@peggleto-mobl.ger.corp.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<4933227.rYH5s4XHH6@peggleto-mobl.ger.corp.intel.com>
	<56B3B6E0.4000309@linux.intel.com>
	<5160543.ahmzsokFdT@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 23/28] Revert "classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable"
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
X-List-Received-Date: Thu, 04 Feb 2016 20:47:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-02-05 at 09:40 +1300, Paul Eggleton wrote:
> On Thu, 04 Feb 2016 14:38:56 Aníbal Limón wrote:
> > No i don't mean that way because i don't agree with this change and
> > i
> > consider this as *CENSURE* because if i someone don't agree a
> > change the
> > why? information need to be placed in the git repository for future
> > references.
> 
> We don't put the entire history of decisions on a change in the git
> history 
> (certainly not in the form of commit and revert, anyway) or it would
> be really 
> hard to follow when looking back in future. If you want to record
> that we 
> discussed this alternative solution, the place to do it would be in
> the commit 
> message where you make the redirection change, which was the
> alternative to 
> this.

I'd also add that this is clearly being discussed on the mailing list,
so there *is* a very clear public record of it.

There are patches I've disagreed with which I have merged and there are
patches I've written, then dropped as after discussion they weren't
right (sstate using xz is a recent obvious one). Censorship would be
not even allowing those discussions to happen, we don't do that, very
much the opposite.

As Paul says, we don't put it all into git history though.

Cheers,

Richard



