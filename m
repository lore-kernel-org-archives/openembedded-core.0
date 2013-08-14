Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-05.prod.phx3.secureserver.net
	(p3plsmtpa07-05.prod.phx3.secureserver.net [173.201.192.234])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0E96007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:51:40 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-05.prod.phx3.secureserver.net with 
	id Cdrf1m00B1mTNtu01drfiT; Wed, 14 Aug 2013 06:51:40 -0700
Message-ID: <520B8B6C.40408@pabigot.com>
Date: Wed, 14 Aug 2013 08:51:40 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: recipe whitespace style questions
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
X-List-Received-Date: Wed, 14 Aug 2013 13:51:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This maybe opens a can of worms, but:

A recent comment on a patch raised the issue of how to do whitespace 
indentation on multiple-line continuations: specifically, how many 
spaces should be used.  This is not addressed in the current style-guide 
and is something I've been confused about too.

I don't know that I particularly care which way it's done, but I would 
like guidance to help me be consistent for recipes I create.

Would a patch to update the style guide with clarifications be 
acceptable?  The intent of the proposed text below is to recommend:

SRC_URI = "file://skeleton \
            file://skeleton_test.c \
            file://COPYRIGHT \
            "

which should be displayed in a fixed-width font with the "file" words 
all aligned.

Next: I can find no documented recommendation in whether the closing 
quote is indented or not.  In addition to above (which in my display has 
the closing quote aligned with the letter 'f' of "file"; call this style 
"content aligned"), I've also seen:

SRC_URI = "file://skeleton \
            file://skeleton_test.c \
            file://COPYRIGHT \
           "

which I'll call "quote aligned", and:

SRC_URI = "file://skeleton \
            file://skeleton_test.c \
            file://COPYRIGHT \
"

which I'll call "none", and;

SRC_URI = "file://skeleton \
            file://skeleton_test.c \
            file://COPYRIGHT"

which I'll call "joined".

Again, for consistency's sake it would be nice to have a 
recommendation.  I personally prefer "none", which matches the closing 
bracket style for functions.

Next: I've also seen:

SRC_URI = " \
     file://skeleton \
     file://skeleton_test.c \
     file://COPYRIGHT \
"

which generalizes the Python 4-space indentation rule and is a nice 
option when the variable name is so long the content would go beyond 80 
characters if it appeared on the first line.

Finally, the use of tabs for shell functions is not preserved by 
meta-openembedded/contrib/oe-stylize.  Do any of the core developers 
recommend using that script, and if so does it need to be updated?  Do 
Yocto project coding standards apply to meta-openembedded?  And what 
about whitespace for multiple-line continuations within a shell 
function: one tab level?

If we can reach some level of consensus (or fiat) I'll prepare a patch 
for the style guide.  I think the following captures the proposed 
clarifications:

* Multiple-line continuations should be indented to the level of the 
content following the introductory quote symbol on the first line.

* Alternatively, the first line of a multi-line value may be continued 
after a single space following the introductory quote symbol and all 
subsequent content lines indented four spaces (or one tab if within a 
shell function)

*Any closing quote of a multiple-line continuation should be placed at 
the indentation level of the first continued line.

If you feel this is all too nit-picky just ignore it.

Peter


