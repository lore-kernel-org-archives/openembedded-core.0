Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA5C731C2;
	Tue, 14 Feb 2017 17:28:19 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:142b:b310:996f:84a3] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cdgtj-0005wU-4O; Tue, 14 Feb 2017 18:28:16 +0100
Message-ID: <1487093294.8657.11.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Patrick Ohly <patrick.ohly@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Tue, 14 Feb 2017 17:28:14 +0000
In-Reply-To: <1487086509.13854.347.camel@intel.com>
References: <20170210082811.GA3021@jama> <1487086509.13854.347.camel@intel.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: multipath-tools on arm (was: Re: State of bitbake world, Failed tasks 2017-02-08)
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
X-List-Received-Date: Tue, 14 Feb 2017 17:28:19 -0000
Content-Type: multipart/alternative; boundary="=-GR8ORFXhwok4fLcnXgIa"

--=-GR8ORFXhwok4fLcnXgIa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 16:35 +0100, Patrick Ohly wrote:
> {standard input}: Assembler messages:
> {standard input}:80: Error: shifts in CMP/MOV instructions are only
> supported in unified syntax -- `mov r12,r12,ror#3'
> {standard input}:80: Error: shifts in CMP/MOV instructions are only
> supported in unified syntax -- `mov r12,r12,ror#13'

This code is imported from valgrind and doesn't work in a Thumb build. 
It's trying to generate a special no-op instruction sequence that the
Valgrind JIT can spot.  There might be a Thumb equivalent in a newer
version of valgrind upstream, I'm not sure.

p.

--=-GR8ORFXhwok4fLcnXgIa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Tue, 2017-02-14 at 16:35 +0100, Patrick Ohly wrote:</div><blockquote type="cite"><div>{standard input}: Assembler messages:</div><div>{standard input}:80: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'</div><div>{standard input}:80: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'</div></blockquote><div><br></div><div>This code is imported from valgrind and doesn't work in a Thumb build.  It's trying to generate a special no-op instruction sequence that the Valgrind JIT can spot.  There might be a Thumb equivalent in a newer version of valgrind upstream, I'm not sure.</div><div><br></div><div>p.</div><div><br></div></body></html>

--=-GR8ORFXhwok4fLcnXgIa--
