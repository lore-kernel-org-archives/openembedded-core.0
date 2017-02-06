Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EFB727199B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 14:44:43 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:c5f6:564a:5bbc:a813] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cakX3-0000xj-KS; Mon, 06 Feb 2017 15:44:43 +0100
Message-ID: <1486392281.22715.7.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Feb 2017 14:44:41 +0000
In-Reply-To: <1486391230.14144.82.camel@linuxfoundation.org>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
	<1486388525.22715.2.camel@pbcl.net>
	<1486391230.14144.82.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: RSS difficulties
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
X-List-Received-Date: Mon, 06 Feb 2017 14:44:44 -0000
Content-Type: multipart/alternative; boundary="=-LNlqObFv7p5bdV+WfxXG"

--=-LNlqObFv7p5bdV+WfxXG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-06 at 14:27 +0000, Richard Purdie wrote:
> What happens if you set DEPENDS?

With DEPENDS I do at least get some entries for ecj-bootstrap-native in
task-depends.dot.  The relevant ones seem to be:

"gnujaf-native.do_prepare_recipe_sysroot" -> "ecj-bootstrap-
native.do_populate_sysroot"
"ecj-bootstrap-native.do_prepare_recipe_sysroot" -> "libecj-bootstrap-
native.do_populate_sysroot"

which looks fairly encouraging.  And in log.do_prepare_recipe_sysroot I
see:

Considering setscene task: ['libecj-bootstrap-native',
'do_populate_sysroot']
  considering dependency: ['ecj-bootstrap-native',
'do_populate_sysroot']
Adding dependency on libecj-bootstrap-native

But sadly the contents of libecj-bootstrap-native doesn't actually show
up in gnujaf-native's recipe-sysroot-native.

p.

--=-LNlqObFv7p5bdV+WfxXG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Mon, 2017-02-06 at 14:27 +0000, Richard Pu=
rdie wrote:</div><blockquote type=3D"cite"><div>What happens if you set DEP=
ENDS?</div></blockquote><div><br></div><div>With DEPENDS I do at least get =
some entries for ecj-bootstrap-native in task-depends.dot.  The relevant on=
es seem to be:</div><div><br></div><div>"gnujaf-native.do_prepare_recipe_sy=
sroot" -&gt; "ecj-bootstrap-native.do_populate_sysroot"</div><div>"ecj-boot=
strap-native.do_prepare_recipe_sysroot" -&gt; "libecj-bootstrap-native.do_p=
opulate_sysroot"</div><div><br></div><div>which looks fairly encouraging.  =
And in log.do_prepare_recipe_sysroot I see:</div><div><br></div><div>Consid=
ering setscene task: ['libecj-bootstrap-native', 'do_populate_sysroot']</di=
v><div>&nbsp; considering dependency: ['ecj-bootstrap-native', 'do_populate=
_sysroot']</div><div>Adding dependency on libecj-bootstrap-native</div><div=
><br></div><div>But sadly the contents of libecj-bootstrap-native doesn't a=
ctually show up in gnujaf-native's recipe-sysroot-native.</div><div><br></d=
iv><div>p.</div><div><br></div><div></div></body></html>

--=-LNlqObFv7p5bdV+WfxXG--
