Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwMbe-00073Z-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:11:35 +0200
Received: by vwe42 with SMTP id 42so1565327vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 16:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=1pRmjzENoDKS5sS6h9IS1GCsY2nz+7DPvLUihMLKLF8=;
	b=I0sWDdmmOTRcXlBeisNRqHAd0hfjtZ1gU1e9O03hqbTmSdbFxy0JmHXFC7nsymH5+E
	tAb1rXKoY76zxklldtwpTwUS3tcM10Wp2xGlv4c+D1Jvbs+xDpYPt2OGIh99/nJoHBqg
	+VVajM3YnIgqkCLrSh0FMNO6cqVjyAJS218Jw=
Received: by 10.52.117.101 with SMTP id kd5mr5453354vdb.364.1314227206865;
	Wed, 24 Aug 2011 16:06:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 16:06:26 -0700 (PDT)
In-Reply-To: <4E555B61.7030803@linux.intel.com>
References: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
	<4E555B61.7030803@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Aug 2011 16:06:26 -0700
X-Google-Sender-Auth: 6TTQOkE4ik1BjyjN2c24sBoTskk
Message-ID: <CABcZANmN17myF+nnG06mXR88JpR-GicX9Cj6=eEUSu_U+AnHSQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [ANNOUNCE] Devshell Usage Change
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
X-List-Received-Date: Wed, 24 Aug 2011 23:11:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 24, 2011 at 1:13 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/24/2011 12:49 PM, Chris Larson wrote:
>>
>> Saul reminded me that I never sent a proper email to let people know about
>> the
>> usability change to devshell, so only those who reviewed the commits
>> know about it.
>>
>> In the new implementation, a single OE_TERMINAL variable controls the
>> behavior.
>>
> So your saying that the TERMCMD no longer works? We have to set both TERMCMD
> and OE_TERMINAL?
>
> That does not makes sense, If I set TERMCMD to use screen then it should use
> screen, with out me having to also set OE_TERMINAL?
>
> Or test TERMCMD go away at this point?
>
> In either case, maybe we need to update the local.conf also.

At the moment, TERMCMD affects the patch reject resolver, but only
because it hasn't been updated to use the new code yet. TERMCMD is
*not* used by the new code, and setting has absolutely no effect for
devshell usage.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


