Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1U7TS3-0004ih-Gh
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 17:20:40 +0100
Received: by mail-ve0-f176.google.com with SMTP id cz10so4928683veb.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=f7kY1aUknIjcwEB/53rQIObpNd+a0UqProGMIjA8PhY=;
	b=YmNhtGW596hOPVX2gUaSqlg++/6UNAa/l56Hi4L0GlmfkvzBok4ZErlexKToPbmOYr
	ucskob6ZgPCzPYjOAdmv97K8TLSNMVYylP1D21FMTdNbRlyNkEoe/IfxafhFVhGjAXjX
	DgsmkBN+oz/JOeVKlGk1bTs0S6BqsGoxRot1zSdQ2hlhxWRnBQGcf0CvUuKdPivjEqjz
	Vt702VkNKEZyfG90LhWyFVHDyG8speRTJ/Si9+m1Xu5ZX/JalMve0iFDlzm+aArZbzJr
	t3RNh7h44evZfwszOdf7DmsAMI1XCWkHS/QBMvVR3sAxGl9pic7oD7G79AqD0A3fCSls
	cS3w==
MIME-Version: 1.0
X-Received: by 10.52.90.211 with SMTP id by19mr14014367vdb.114.1361203453251; 
	Mon, 18 Feb 2013 08:04:13 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 18 Feb 2013 08:04:13 -0800 (PST)
In-Reply-To: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
References: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
Date: Mon, 18 Feb 2013 18:04:13 +0200
Message-ID: <CAF6bG8dW=kCYM3c-_4A_hzNjiAQZjz6YKByZDjLYZR4y3j2-Aw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg: upgrade to 9
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
X-List-Received-Date: Mon, 18 Feb 2013 16:20:42 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 17:47, Constantin Musca <constantinx.musca@intel.com> wrote:
> License checksum change due to:
> - version modification
> - links modification
> - additional license explanations
>
> fix_for_automake_1.12.1.patch: not needed anymore
>
> fix-jmorecfg-boolean-enum.patch: added
> - we have to undef TRUE & FALSE in order to define
> the boolean enum
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>

 Have you tried to build webkit-gtk against this? At one point I had
similar jpeg update in my tree causing webkit-gtk build failure.


 - ML


