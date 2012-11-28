Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tdna3-0001pt-JJ
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:59 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so14696193ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7rbRzhDskWiQr1DF/YH5gCdrZGNLbYezQsGP8ItlPws=;
	b=YnPQXwrhyYz90E+JPrw7q7jBL/tERlvWvEK/RtQkZCuJXPt2VxR0lFQQyxdcbVq4qO
	ldOcDQ4Q3oa/JcfMOZUQ6FX7VYjpy+cVtTyhKihBY1cGWdqA9TZvCT4FNuYmvaOAqPYj
	LYpN1ZisT3fppHjDzf31bQA9fgG9effHcgi/Wbysyjg1gBb0Cn4cH4ACaSxHlvX+rm6A
	0K3XT8d9/1hZmHdxP57lVFGxixTgc2OtYj97PjUdxAcpG4YGIDT3Gb5YwFVnEOFb0C7W
	nj70H8NC3+J8nKBSwCWFysR0Cdlmk7GhjFnpT9HmRgcixwszgH9eZxQR4ECjwmm75fVX
	3ivg==
MIME-Version: 1.0
Received: by 10.43.9.131 with SMTP id ow3mr17886753icb.21.1354131104478; Wed,
	28 Nov 2012 11:31:44 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Wed, 28 Nov 2012 11:31:44 -0800 (PST)
In-Reply-To: <50B66559.5010402@linux.intel.com>
References: <1354127226-24827-1-git-send-email-cazfi74@gmail.com>
	<50B66559.5010402@linux.intel.com>
Date: Wed, 28 Nov 2012 21:31:44 +0200
Message-ID: <CAF6bG8erj9dh95+FKNzX_Fx7Ujm0VcMRCRO9tNFLkw6Jo033_Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] readline: apply upstream patches
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:59 -0000
Content-Type: text/plain; charset=UTF-8

On 28 November 2012 21:26, Saul Wold <sgw@linux.intel.com> wrote:
> I was going to add that I think the apply=yes is default and therefore not
> required here.

 Is it for files that do not have .patch suffix? With my first quick
test it didn't work.


 - ML


