Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78E5F60821
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 09:12:37 +0000 (UTC)
Message-ID: <51BED302.8020107@communistcode.co.uk>
Date: Mon, 17 Jun 2013 10:12:34 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: commit 07792e4a83ca breaks oe-init-build-env sourcing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 09:12:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Pulled to the latest oe-core, bitbake and a few 3rd party layers this 
morning, to find that when I source oe-init-build-env the terminal I was 
sourcing in either crashes or exits.

I tested with both gnome-terminal and xterm, both produced the same 
behaviour.

Heading into a git bisect the apparent bad commit is: 
07792e4a83ca4f1c8152c228813c7f795fa6a545 (scripts/oe-buildenv-internal 
bitbake: Migrate python version checks)

If it makes a difference the default python on my system is python3. My 
workflow is usually source oe-init-build-env, then I add a directory 
with a symlink to python2 at the beginning of my PATH, so the default 
python is python2.

Any help would be appreciated; holler if you need me to run any more tests.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--

