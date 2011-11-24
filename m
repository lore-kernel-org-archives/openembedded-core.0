Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RTckW-0004Bv-8a
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 18:06:14 +0100
Received: (qmail 13333 invoked by uid 1003); 24 Nov 2011 16:59:38 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Nov 2011 16:59:38 -0000
Message-ID: <4ECE77F9.5090703@balister.org>
Date: Thu, 24 Nov 2011 11:59:37 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECBE307.1080600@linaro.org>
In-Reply-To: <4ECBE307.1080600@linaro.org>
X-Enigmail-Version: 1.1.2
Subject: Re: Getting started on creating a layer for OE-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 17:06:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/22/2011 12:59 PM, Ken Werner wrote:
> Hi,
> 
> I'm currently reading the OpenEmbedded User Manual and wondering what's
> the best way to add a layer for the Linaro toolchain components (Linaro
> GCC, Linaro GDB). This is my first time with OE. I just setup the
> environment and started to build an image that targets qemuarm (bitbake
> is still building). Any suggestions or general help is much appreciated.

Can you comment on what you expect to get out of the Linaro toolchain layer?

As had been noted here, OE already has some of the Linaro work in the
toolchains. However, we have had issues with some patches so we can't
run a "complete Linaro toolchain". (Toolchain guys, correct me if I am
wrong)

From my perspective, the Linaro work is great (I primarily use Cortex-A8
devices), but my understanding is that due to Linaro's focus on advanced
ARM processors, regressions for other architectures and older arms can
occur.

So I see the point of a dedicated Linaro tool layer being an excellent
vehicle for testing Linaro's work on a diverse set of machines to make
life easier for people using Linaro's work on other architectures.

Philip


