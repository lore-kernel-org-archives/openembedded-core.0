Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TJ4P6-0004p1-Qq
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:29:01 +0200
Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Oct 2012 08:16:01 -0700
Received: by qcsj3 with SMTP id j3so2573701qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 08:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=LkD7/hGDkR1UQJqmuruJdwAZsZadixX8t9m0edbVEM4=;
	b=NFCfNI5Yj8kFS/Qgc+DMju4ffn+qTjBHJlSLwEhkQRhiM6flGEYw8Sm9+Cr3WMSUhF
	owUezZ5wkTI4s3MGENrg/7BsA5alDNlXAhAwqYUN5t5pILwQJcyWEsbWZdjwn82jw9cL
	xC2B4/3XAhEABgPqRVwNZImaSkFjCGfyZuWtAcrvp0m1AdyxVLQ638KHQlfIUWsA8oa2
	mThitjuCKe7R7HhQEcYCVRYbDTQnEdgczz1IQKu6gvZXqMZlPrxttXr4B1YzhuwHAVyR
	6XARbEW4jiaxWhJPGXsJWoWxLLhnkJjD118fU6jZJsD6dLr+dMXOTPCyJRUR43H5gFCf
	/WRA==
MIME-Version: 1.0
Received: by 10.49.85.194 with SMTP id j2mr5598590qez.54.1349190960112; Tue,
	02 Oct 2012 08:16:00 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Tue, 2 Oct 2012 08:16:00 -0700 (PDT)
In-Reply-To: <1349174767.32611.79.camel@phil-desktop>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
	<38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
	<1349174767.32611.79.camel@phil-desktop>
Date: Tue, 2 Oct 2012 08:16:00 -0700
Message-ID: <CAPhnLPBNv8EVfJsfNfGo9tTNTu55GLR9A8GnxnYOygQp9yVjYw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQlwa/xnoXs8XQPNMlEGkhlvSnS//aUVG+g4sF4FZtXflTCyNO4mCMgmqX7EQtci6ChBAlmG
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] OECore license fixes: meta/*
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
X-List-Received-Date: Tue, 02 Oct 2012 15:29:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 2, 2012 at 3:46 AM, Phil Blundell <philb@gnu.org> wrote:
>
> This (and the corresponding change to busybox) doesn't seem quite right.
> Although it is true that the bzip2 licence does have four clauses and is
> approximately BSD-ish, these four clauses are not actually the same as
> the ones in the traditional 4-clause BSD licence.

That's correct, thanks for the catch. When I was going through these,
I relied on a lot on what others had listed the package as. OBS lists
it as BSD (3 clause I believe). Gentoo lists it as bzip2.
I dislike having singular licenses but in this case, due to clause 2
and 3, the correct path here is to change it back to bzip2, add the
bzip2 text to the license directory and then email the bzip2
developers and ask them if BSD-4-clause is appropriate or not. I'll do
that today.

-b

>
> The four clauses that the bzip2 licence actually has are (to quote
> LICENSE):
>
> 1. Redistributions of source code must retain the above copyright
>    notice, this list of conditions and the following disclaimer.
>
> 2. The origin of this software must not be misrepresented; you must
>    not claim that you wrote the original software.  If you use this
>    software in a product, an acknowledgment in the product
>    documentation would be appreciated but is not required.
>
> 3. Altered source versions must be plainly marked as such, and must
>    not be misrepresented as being the original software.
>
> 4. The name of the author may not be used to endorse or promote
>    products derived from this software without specific prior written
>    permission.
>
> Whereas, the four clauses from the original BSD are:
>
> 1. Redistributions of source code must retain the above copyright
>    notice, this list of conditions and the following disclaimer.
>
> 2. Redistributions in binary form must reproduce the above copyright
>    notice, this list of conditions and the following disclaimer in the
>    documentation and/or other materials provided with the distribution.
>
> 3. All advertising materials mentioning features or use of this software
>    must display the following acknowledgement:
>    This product includes software developed by the <organization>.
>
> 4. Neither the name of the <organization> nor the
>    names of its contributors may be used to endorse or promote products
>    derived from this software without specific prior written permission.
>
> Clauses 1 and 4 are clearly the same thing (or very nearly identical)
> but clauses 2 and 3 are significantly different in both wording and
> intent.  In particular the bzip2 license contains no equivalent to the
> objectionable "advertising clause".
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


