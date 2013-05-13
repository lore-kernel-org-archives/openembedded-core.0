Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UbusV-00043k-TY
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:41:32 +0200
Received: by mail-oa0-f43.google.com with SMTP id o6so7664856oag.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ckWrlObP6aYmG5Q3K2R6aBqFevN0eAVdYE58W3iMMRY=;
	b=aUi5gerQtxoavxuk8YEpTt9h9+JCVuIi1jKifZHObpQIs5U2/u3QRD3FpWc6ESe59I
	7mXBDgUYCzP0UXJ+/wD+hPPjF6kLNGtwkaB3RzgUVwEBrNbqkgdQMcI+zCubJ9DOsYKC
	rzKbBItwibFc5ZAXJqWp0CuI8NzULbUcnSLY/xmDPhsvtmPSEdke+6JLqpCjneORyhDy
	rS1pBljguC1F0PK3Q+q/8T1ahlkIi5voPYHV9IcfmJW2vtAwTtgA6bCVLuX+CtSDE+6Z
	gupDVcTxOlU7uRM5LrYEQugpWvddvf/OXO7uSGUXhoQcWmMTnuBV4eHRCToT1UqzD+KW
	vPTQ==
MIME-Version: 1.0
X-Received: by 10.60.35.100 with SMTP id g4mr2002815oej.53.1368458601246; Mon,
	13 May 2013 08:23:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 13 May 2013 08:23:21 -0700 (PDT)
In-Reply-To: <CAJTo0LYzafv3Eb3QtbVT+jbRkfPN2_vUxh0bsS0WZ9bJc8-NaQ@mail.gmail.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
	<CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
	<517B30A4.5050405@windriver.com>
	<CAJTo0LYzafv3Eb3QtbVT+jbRkfPN2_vUxh0bsS0WZ9bJc8-NaQ@mail.gmail.com>
Date: Mon, 13 May 2013 12:23:21 -0300
X-Google-Sender-Auth: QZR2KBSVswbNWxWbelI7OiGOOdQ
Message-ID: <CAP9ODKrOs_bqf0g5Aw3WhJ3ZVoNM2aqMCoQzWZ+8e9LX7cwscg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Mon, 13 May 2013 15:41:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 27 April 2013 02:57, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Thanks for the review, please see more comments:
>> The glib-2.0-native had already depend on python-native before this patch,
>> the depends chain is:
>>
>> glib-2.0-native -> python-argparse-native -> python-native
>
> That argparse usage was dropped from upstream in 2.30, so we can drop
> the dependency.
>
> I still think that we shouldn't have to build a whole python because a
> distribution decided to not install fundamental parts of Python out of
> the box (python-xml).

We may need to have a mechanism to specific build dependencies for
native depending on host version/distribution.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


