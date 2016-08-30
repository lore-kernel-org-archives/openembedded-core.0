Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 1818 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Aug 2016 16:07:50 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2840B6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:07:50 +0000 (UTC)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
Date: Tue, 30 Aug 2016 16:37:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: gcc 6.1+ and isystem
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
X-List-Received-Date: Tue, 30 Aug 2016 16:07:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Some of the headers shipped with gcc 6.1 and above now use #include_next 
to try to and do clever things with munging system header files. Our 
injection of isystem into the build at 'meta/conf/bitbake.conf' seems to 
be causing some programs to fail to compile. A full explanation can be 
found at [1], a bug report from GCC specifying that it should only be 
used in extreme cases at [2].

Since we seem to be adding -isystem unconditionally to BUILD_CFLAGS from 
bitbake, and that the default behavior has now changed should this be 
revisited? I'll admit that I am no where near experienced enough with 
GCC and friends internals to make a call on this one, I'm just looking 
for some input.

Regards,
Jack.

[1] 
http://stackoverflow.com/questions/37218953/isystem-on-a-system-include-directory-causes-errors
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129

