Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <listas@dorilex.net>) id 1Qr1Mu-0003QW-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 07:30:16 +0200
Received: by pzk2 with SMTP id 2so1604074pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 22:25:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.166.1 with SMTP id o1mr600670wfe.242.1312953945143; Tue,
	09 Aug 2011 22:25:45 -0700 (PDT)
Received: by 10.68.50.5 with HTTP; Tue, 9 Aug 2011 22:25:45 -0700 (PDT)
In-Reply-To: <33AB447FBD802F4E932063B962385B3512D96A8247@shsmsx501.ccr.corp.intel.com>
References: <1312919065-7554-1-git-send-email-ldorileo@gmail.com>
	<33AB447FBD802F4E932063B962385B3512D96A8247@shsmsx501.ccr.corp.intel.com>
Date: Wed, 10 Aug 2011 01:25:45 -0400
Message-ID: <CAEbFTWdT6m267tfftg5+Fedq3OWFe8E0--5YDuFO1H4BP1qwVQ@mail.gmail.com>
From: Leandro Dorileo <listas@dorilex.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/combo-layer: a simple way to script the como-layer conf
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
X-List-Received-Date: Wed, 10 Aug 2011 05:30:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ke,

On Tue, Aug 9, 2011 at 11:01 PM, Yu, Ke <ke.yu@intel.com> wrote:
> It looks good to me. You may also want to update the config file descript=
ion in the "class Configuration". So that user will be aware of the usage.

Ok. I've addressed that in a last patch I've sent.

Thanks for reviewing...

Regards...
Leandro Dorileo

>
> Regards
> Ke
>
>> -----Original Message-----
>> From: Leandro Dorileo [mailto:ldorileo@gmail.com]
>> Sent: Wednesday, August 10, 2011 3:44 AM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Yu, Ke; Leandro Dorileo
>> Subject: [PATCH] scripts/combo-layer: a simple way to script the como-la=
yer
>> conf
>>
>> This small patch introduces a a very simple and basic way to script the =
combo-
>> layer conf file. With that a combo can be shared with no need to change =
its
>> config - associated to the use of environment variables for example.
>>
>> *Similar* to bitbake it considers every value starting with @ to be a py=
thon
>> script. So local_repo could be easily configured as:
>>
>> [bitbake]
>> local_repo =3D @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
>>
>> or any more sophisticated python syntax.
>>
>> Signed-off-by: Leandro Dorileo <ldorileo@gmail.com>
>> ---
>> =A0scripts/combo-layer | =A0 =A03 +++
>> =A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/scripts/combo-layer b/scripts/combo-layer index d129175..3d=
adf4a
>> 100755
>> --- a/scripts/combo-layer
>> +++ b/scripts/combo-layer
>> @@ -91,6 +91,9 @@ last_revision =3D
>> =A0 =A0 =A0 =A0 =A0for repo in self.parser.sections():
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0self.repos[repo] =3D {}
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0for (name, value) in self.parser.items(repo):
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0if value.startswith("@"):
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0self.repos[repo][name] =3D eval(value.s=
trip("@"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0else:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0self.repos[repo][name] =3D value
>>
>> =A0 =A0 =A0def update(self, repo, option, value):
>> --
>> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


