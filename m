Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id E687C60169
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 14:18:27 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 73BC23F6B5;
	Mon,  3 Nov 2014 15:18:27 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.499
X-Spam-Level: 
X-Spam-Status: No, score=-0.499 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon,  3 Nov 2014 15:18:24 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon,  3 Nov 2014 15:18:23 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 3 Nov 2014 15:18:38 +0100
Message-ID: <54578EAF.3090904@topic.nl>
Date: Mon, 3 Nov 2014 15:18:23 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <54354CBD.6040506@topic.nl>	<CAP9ODKpERB+agUBv3-BgPM3JRBQiZ-QKVhONvuSkRFUWi_ZkqQ@mail.gmail.com>	<54377059.10606@topic.nl>	<1796874.7cz1rBMpRa@peggleto-mobl5.ger.corp.intel.com>
	<54451581.6020409@topic.nl>
In-Reply-To: <54451581.6020409@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: Request to move "gitpkgv.bbclass" from meta-oe to oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Nov 2014 14:18:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI'm afraid this will go the same path as the previous attempt at g=
etting=20
gitpkgv equivalent into oe-core, which is, it'll silently disappear until=20
someone with both the internal knowledge and the time to implement it will=
=20
pick it up again...

M.

On 10/20/2014 04:00 PM, Mike Looijmans wrote:
> On 10/10/2014 05:03 PM, Paul Eggleton wrote:
>> Hi Mike,
>>
>> On Friday 10 October 2014 07:36:25 Mike Looijmans wrote:
>>> On 10/10/2014 12:15 AM, Otavio Salvador wrote:
>>>> On Thu, Oct 9, 2014 at 4:56 PM, Richard Purdie
>>>>
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Thu, 2014-10-09 at 10:16 +0200, Mike Looijmans wrote:
>>>>>> =EF=BB=BFIn partial reply to my own question, this has been discusse=
d 2 years
>>>>>> ago, but apparently nothing ever came out of it.
>>>>>>
>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2012-Febru=
ary/
>>>>>> 056050.html
>>>>>>
>>>>>> So once more the request to be able to get sane version strings for =
git
>>>>>> repos. Can we please just move gitpkgv. That's like five minutes wor=
k,
>>>>>> and if anyone (e.g. me) feels like building something better, he or =
she
>>>>>> is free do submit that and get rid of the gitpkgv class once it's
>>>>>> obsolete.
>>>>>
>>>>> I do feel quite strongly that this is something which should get
>>>>> improved in the fetcher itself. That is why I've pushed back on the
>>>>> patch since if I take it into OE-Core, there is even less incentive t=
o
>>>>> fix the real problem...
>>>>
>>>> Mike I am also an user of gitpkgv but I must to agree with Richard
>>>> here. Moving this to OE-Core will just make it worse. It is way better
>>>> to prepare a patch and add support for it on the fetcher code of
>>>> BitBake.
>>>
>>> Give me some pointers on what you're talking about here, and I'll be ha=
ppy
>>> to try and implement it. Currently I have no idea as to what is "wrong"
>>> with the gitpkgv approach, and I also have no clue as to what it is you
>>> want to have implemented in the git fetcher.
>>
>> The code would go into the fetcher itself i.e. lib/bb/fetch2/git.py and
>> lib/bb/fetch2/__init__.py.
>>
>> I'm not sure whether it would be a case of setting a variable in order t=
o have
>> the value of SRCPV within OE (which calls bb.fetch2.get_srcrev() ) retur=
n the
>> "git describe" style version instead of the current one, or whether we w=
ould
>> preserve the separate GITPKGVTAG variable for that purpose. (The GITPKGV=
 case
>> is already handled by the current behaviour of SRCPV, right?)
>>
>> FWIW there is an open bug covering this issue:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2872
>
> I followed that link a few clicks deeper and noticed that Richard Purdie
> suggested adding another interface method, but I couldn't quite understan=
d
> what he meant here.
>
>
> I figured that "sortable_revision" was the method that I needed to delve =
into.
> However, it turned out that this one is called about 50 times when buildi=
ng a
> single package, and i cannot really run any git commands at that spot it
> seems, the current directory is not inside the repo.
>
> So that's a fail (my trial code from git.py with some extra logger output=
 below).
>
>
>
>      def sortable_revision(self, ud, d, name):
>          """
>          Return a sortable revision number by counting commits in the his=
tory
>          """
>          rev =3D self._build_revision(ud, d, name)
>          logger.warn("git.sortable_revision url=3D%s" % (ud.url))
>          localpath =3D ud.localpath
>          rev_file =3D os.path.join(localpath, "oe-gitpkgv_" + rev)
>          if not os.path.exists(localpath):
>              logger.warn("git.sortable_revision non-existent: %s" % (loca=
lpath))
>              commits =3D None
>          else:
>              if not os.path.exists(rev_file) or not os.path.getsize(rev_f=
ile):
>                  from pipes import quote
>                  commits =3D bb.fetch2.runfetchcmd(
>                          "git rev-list %s -- 2> /dev/null | wc -l" %
> (quote(rev)),
>                          d, quiet=3DTrue).strip().lstrip('0')
>                  if commits:
>                      os.unlink(rev_file)
>                      open(rev_file, "w").write("%d\n" % int(commits))
>              else:
>                  commits =3D open(rev_file, "r").readline(128).strip()
>          logger.warn("git.sortable_revision commits=3D%s\n" % (commits))
>          if commits:
>              return False, "%s+%s" % (commits, rev[:7])
>          else:
>              return True, str(rev)



Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


