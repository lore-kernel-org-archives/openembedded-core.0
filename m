Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 03D8960670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 18:47:18 +0000 (UTC)
Received: (qmail 9003 invoked by uid 1003); 30 Aug 2016 18:47:18 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.12.218)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	30 Aug 2016 18:47:18 -0000
To: Jack Mitchell <ml@embed.me.uk>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
From: Philip Balister <philip@balister.org>
Message-ID: <3ad18432-f58d-5ff3-3f18-8e39e1a43cfa@balister.org>
Date: Tue, 30 Aug 2016 14:47:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
Subject: Re: gcc 6.1+ and isystem
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
X-List-Received-Date: Tue, 30 Aug 2016 18:47:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/30/2016 11:37 AM, Jack Mitchell wrote:
> Some of the headers shipped with gcc 6.1 and above now use #include_next
> to try to and do clever things with munging system header files. Our
> injection of isystem into the build at 'meta/conf/bitbake.conf' seems to
> be causing some programs to fail to compile. A full explanation can be
> found at [1], a bug report from GCC specifying that it should only be
> used in extreme cases at [2].
> 
> Since we seem to be adding -isystem unconditionally to BUILD_CFLAGS from
> bitbake, and that the default behavior has now changed should this be
> revisited? I'll admit that I am no where near experienced enough with
> GCC and friends internals to make a call on this one, I'm just looking
> for some input.

I think this issue is casuing me trouble building GNU Radio with qt5
support also. I'll try and verify this. I never did figure out where the
-isystem came from. Thanks for the email Jack!

Philip


> 
> Regards,
> Jack.
> 
> [1]
> http://stackoverflow.com/questions/37218953/isystem-on-a-system-include-directory-causes-errors
> 
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129

