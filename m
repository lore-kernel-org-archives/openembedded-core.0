Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id C506C6B5D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 10:19:55 +0000 (UTC)
Message-ID: <52CFC948.104@communistcode.co.uk>
Date: Fri, 10 Jan 2014 10:19:52 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [QA Issue] liblto found in wrong location
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
X-List-Received-Date: Fri, 10 Jan 2014 10:19:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

WARNING: QA Issue: gcc-cross-canadian-i586: found library in wrong
location:
/opt/cbnl/oecore-sdk/1/sysroots/i686-oecore-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/4.8.2/liblto_plugin.so.0
gcc-cross-canadian-i586: found library in wrong location:
/opt/cbnl/oecore-sdk/1/sysroots/i686-oecore-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/4.8.2/liblto_plugin.so.0.0.0
gcc-cross-canadian-i586: found library in wrong location:
/opt/cbnl/oecore-sdk/1/sysroots/i686-oecore-linux/usr/libexec/i586-oe-linux/gcc/i586-oe-linux/4.8.2/liblto_plugin.so

It seems like the library is being found in an installed SDK on my host?
I have no idea where to start with this, the gcc-target.inc specifies it
in FILES, but apart from that I can't find any reference to it, maybe
due it being a core GCC lib?

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

