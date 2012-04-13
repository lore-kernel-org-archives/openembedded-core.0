Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIl1z-000817-Nn
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 20:15:35 +0200
Received: by lagw12 with SMTP id w12so2474222lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=bmpZgNFWxSLHv0VkQcZelfxXzNNrSzqZ3ObVAbkXTPc=;
	b=v3AZ0+oyQMBOXxL+wiHO9ykJoF7xF/edXxelxHGvFCJM83cBqDUxLg5CmoPp3wTVdd
	INEJuiVq80U29cCJiDRUQXsAP2nXEtZuk008D+JfA2+zS5WFG1+Ewdwm3GF9nTbin4uM
	toD7FJxLOwE5AGRycUf2YSqvCBe9g3hzDul9lETEifUeoudmtlLj7U5M1hPI0NP4DAEw
	23pMqCyQXJ8RYWXlnS0RJOeiq1ijJB27zMAK1kAO02f2wbtjn9vKGxS6DP+DF6qU3M7k
	JMCJGZPGusDLQtN5ccYQcYaAYpCMZqHOvl8/19kej2KeoZIR9lFYLJ9taA0sILd5Uquv
	s2cQ==
Received: by 10.152.113.229 with SMTP id jb5mr2267161lab.45.1334340374159;
	Fri, 13 Apr 2012 11:06:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 11:05:43 -0700 (PDT)
In-Reply-To: <1334322828.7309.73.camel@ted>
References: <1334318173.7309.70.camel@ted> <1334322828.7309.73.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 11:05:43 -0700
Message-ID: <CAMKF1spOq_OXi4gamYwFqOBLc0smzQg-1hSQUmj2skh+E35KvQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] gcc-4.6: Add fix for relocation problem and ccache
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
X-List-Received-Date: Fri, 13 Apr 2012 18:15:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 13, 2012 at 6:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If the toolchain is reused from sstate and ccache is installed, build failures
> were occuring due to gcc trying to access the original sysroot rather than the
> new one, particularly if the old sysroot existed but was not readable by the
> current user.
>
> This turns out of the an issue inside gcc to do with preservation of the sysroot
> option. See the gcc patch for more details. It only triggers when preprocessed
> sources are used which happens when ccache is used.
>
> The same issue occurs with c++ and c++-cpp-output so the same fix is applied there.
>
> [YOCTO #2074]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

looks good.

Acked-by: Khem Raj <raj.khem@gmail.com>


