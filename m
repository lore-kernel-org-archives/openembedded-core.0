Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=393c5c6b8=rich.pixley@palm.com>)
	id 1S0fWw-0004Vc-2a for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 21:44:46 +0100
X-IronPort-AV: E=Sophos;i="4.73,471,1325491200"; d="scan'208";a="11868511"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 23 Feb 2012 12:36:23 -0800
Received: from joso.noir.com ([10.100.2.14])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q1NKaMP6029072;
	Thu, 23 Feb 2012 12:36:23 -0800
Message-ID: <4F46A346.3050809@palm.com>
Date: Thu, 23 Feb 2012 12:36:22 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F457B4B.4000507@palm.com>
	<CAHQecY7-=cwCA7PXYhf3xes+SMsWo6qffwkQk6ckzRsP5ys7oA@mail.gmail.com>
	<E9FAD6E1E68141CCA2CF166F1762B320@gmail.com>	<4F458CAA.7040107@palm.com>
	<1329992162.32110.53.camel@ted> <4F46919E.2050204@palm.com>
	<1330027895.32110.84.camel@ted>
In-Reply-To: <1330027895.32110.84.camel@ted>
Subject: Re: sharing DL_DIR?
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
X-List-Received-Date: Thu, 23 Feb 2012 20:44:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/12 12:11 , Richard Purdie wrote:
> On Thu, 2012-02-23 at 11:21 -0800, Rich Pixley wrote:
>> On 2/23/12 02:16 , Richard Purdie wrote:
>>> On Wed, 2012-02-22 at 16:47 -0800, Rich Pixley wrote:
>>>> What happens if two separate bitbake invocations both simultaneously
>>>> attempt to download the same file?
>>> The first will download it, the second will wait for it to finish, then
>>> both will continue with the downloaded file.
>> How does the second know that the first is in progress?
> It won't be able to take the lock and the done stamp file doesn't exist
> yet.
What lock?

I've just read through lib/bb/fetch2/__init__.py but I'm not seeing a 
lock.  What am I missing?

--rich


