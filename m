Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id C62A2772FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:35:26 +0000 (UTC)
Received: (qmail 20364 invoked by uid 1003); 24 Feb 2016 16:35:26 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@71.171.13.83)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Feb 2016 16:35:26 -0000
To: Trevor Woerner <twoerner@gmail.com>, Joshua Lock
	<joshua.g.lock@intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<56CDD519.9050109@gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <56CDDBCD.6090303@balister.org>
Date: Wed, 24 Feb 2016 11:35:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56CDD519.9050109@gmail.com>
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 16:35:28 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02/24/2016 11:06 AM, Trevor Woerner wrote:
> Ideally the work done here and the work done on meta-swupdate[1] would
> be somehow merged so people creating images/distros would only have to
> learn and integrate one software update solution, instead of having to
> evaluate and choose between the two (or more?).
> 
> 
> [1] https://github.com/sbabic/meta-swupdate

Amen. I had the same thoughts reading the patch set intro.

Maybe the swupd should go in a seperate layer so we can see which
project works best for oe users before moving something directly into
oe-core?

Philip

