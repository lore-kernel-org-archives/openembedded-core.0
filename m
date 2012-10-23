Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TQbJe-0002Mj-U2
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 12:02:30 +0200
Received: from [192.168.0.2] (host81-153-114-169.range81-153.btcentralplus.com
	[81.153.114.169]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 4378B99A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 10:49:07 +0100 (BST)
Message-ID: <50866812.10408@r-finger.com>
Date: Tue, 23 Oct 2012 10:49:06 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
	<CAPj87rOXzZ5EwKYCrBnYtYAQo3cUyXtXyyDSh2nKh05Gy=uY9A@mail.gmail.com>
	<50865733.40007@r-finger.com>
	<CAPj87rOZokkPT_a7kbaqmai2bWwV5xLL8oV2UNOfoxkARHfwCg@mail.gmail.com>
In-Reply-To: <CAPj87rOZokkPT_a7kbaqmai2bWwV5xLL8oV2UNOfoxkARHfwCg@mail.gmail.com>
Subject: Re: [RFC] OpenGL packaging/staging policy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 10:02:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/12 10:18, Daniel Stone wrote:
>> Regardless what is done with the packaging, allowing only mesa to stage
>> dev files will break things. GL headers are not interchangeable, even if
>> all the implementers are well behaved (which is a big if), the
>> *platform.h files are allowed to be implementation specific and so have
>> to be staged by the actual platform GL stack.
> 
> Right, I do agree with you, but in the mixed-stack situation, which
> headers are we building against? :)

The GL / GLES / GLES2 / EGL headers are separate from each other, so in
theory if you have separate libgl, libles, libgles2, and libegl
packages, you could even stage them from four different sources. But for
the Cedar Trail scenario a separate big GL and a combined GLES/GLES2/EGL
package, plus a package for common libs. This might be of some use for
others (IIRC, the whole discussion about this was sparked after enabling
EGL in the mesa package), though it means building mesa multiple times.

Tomas


