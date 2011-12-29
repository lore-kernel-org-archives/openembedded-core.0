Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RgOAs-0001l5-Hc
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 23:10:10 +0100
Received: by qabg14 with SMTP id g14so9446213qab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 14:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=X1YOBvnzUJT9x1uHx76Bjgf0d+93X6qy+mOn/qMy7L0=;
	b=mL401O7dXyOhmSgzKdW1bVLwBomtBE5+tJfu8nWZ36fuQ6Il+7d4oAntts2Tx9Co+v
	zASA08xtfXWbBP63jAxsS3GHkChp5vhZAtP8e278Ut3b+EVUOP3+IGcqtgCVU5OJ6vx/
	qtIItrQsAZ7GH2P/OIndjJhnCjXvnv7YtjyVE=
Received: by 10.224.34.202 with SMTP id m10mr44088016qad.62.1325196175251;
	Thu, 29 Dec 2011 14:02:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.187.141 with HTTP; Thu, 29 Dec 2011 14:02:34 -0800 (PST)
In-Reply-To: <4EFCE30A.80203@linux.intel.com>
References: <1325117322-27695-1-git-send-email-kergoth@gmail.com>
	<4EFCE30A.80203@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 29 Dec 2011 15:02:34 -0700
Message-ID: <CABcZANkzpk+UFJcsGgQMYHoVh=p-dCPBpmQvWG07rz23W43xxw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] elfutils: fix for dso link change in recent ld
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
X-List-Received-Date: Thu, 29 Dec 2011 22:10:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2011 at 3:00 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/28/2011 04:08 PM, Christopher Larson wrote:
>>
>> From: Christopher Larson<chris_larson@mentor.com>
>>
>> This patch makes the link to the dependencies of libdw explicit, as rece=
nt
>> ld
>> no longer implicitly links them. See
>> http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
>> a similar example of the error message you can encounter without this
>> patch,
>> and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
>> https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for
>> more
>> details.
>>
>> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
>> ---
>> =C2=A0.../elfutils/dso-link-change.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 32
>> ++++++++++++++++++++
>
>
> Shouldn't this be delivered into the elfutils/elfutils sub-directory?

Erm, yes. Ignore, will resend.
--=20
Christopher Larson


