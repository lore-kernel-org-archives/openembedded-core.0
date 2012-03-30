Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDi2l-00042a-Q2
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 22:03:31 +0200
Received: by qcso7 with SMTP id o7so573468qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Yq9D2NLeybK5ZfO6zVz347gfhGb0u9SNaRAv0tv7hG0=;
	b=oHajbQzzWCmn7UzYZl7rrn3viBS0GfuFZ7tsMwX9JdS7qfUnXfWhdIG9UtGPUk+ar1
	9wfOAt2UtWS6iYxxnPmyi/Pp2QB2mmAMiDzNrfeCokrQgYbe8Bokiy2llXY+OFNO/O1w
	EO+NUstvy+U0ZZnmXL7Yka9AcuWynpOUOb3w4+ug+DTa5SQ1vnl45qQ7ftL2gPbb0UpX
	x4PoFTxl7YU4wz42Wc/q5WDapJl4b+ZreVY4CfWcxRJ2ho7GNmjhLArIR9D3M8/Z9Ew0
	OQPPqIVoAXRziJBzPxsf17LK/AJeTG+z8LqNhHqaDZ3Q8LIeOthgEsHb9pUcyuiLZa9v
	mS4A==
Received: by 10.224.182.201 with SMTP id cd9mr76222qab.92.1333137266471; Fri,
	30 Mar 2012 12:54:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 12:54:06 -0700 (PDT)
In-Reply-To: <20120330195030.GA24301@denix.org>
References: <alpine.DEB.2.02.1203300551220.28382@oneiric>
	<20120330195030.GA24301@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 12:54:06 -0700
X-Google-Sender-Auth: N0jicEo8qaYQThYwCGdgjnrvcVY
Message-ID: <CABcZANkeLoWBZbBA_hzyssvm21AO3PaF3LEjvMvLzpoxXekpjA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: require/include a .bb file in the same directory?
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
X-List-Received-Date: Fri, 30 Mar 2012 20:03:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 12:50 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Fri, Mar 30, 2012 at 05:59:22AM -0400, Robert P. J. Day wrote:
>>
>> =C2=A0 couple questions about the require/include directives. =C2=A0firs=
t, can
>> you include *any* valid text file? =C2=A0not just your standard .inc fil=
e
>> (even though that is of course the most common thing to do).
>>
>> =C2=A0 and second, i'm looking at this example in meta/recipes-core/imag=
es,
>> where the recipe file core-image-minimal-mtdutils.bb is defined as:
>>
>> require core-image-minimal.bb
>> IMAGE_INSTALL +=3D "mtd-utils"
>>
>> that looks perfectly reasonable since that required .bb file is in the
>> same directory, and this is clearly just defining a new image recipe
>> by adding one more package.
>>
>> =C2=A0 but the explanation of include/require in the bitbake manual is:
>>
>> "if the path specified on the include line is a relative path,
>> BitBake will locate the first one it can find within BBPATH."
>>
>> =C2=A0 that suggests that, by some massively unlikely fluke, i might
>> unknowingly have an identically-named recipe file earlier in my BBPATH
>> variable and that earlier one is the one that would be included. =C2=A0i=
s
>> that correct?

The directory the recipe lives in gets temporarily injected into
BBPATH as the first element.
--=20
Christopher Larson


