Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 430A765CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 14:00:37 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 67A053F6A2;
	Mon, 20 Oct 2014 16:00:36 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon, 20 Oct 2014 16:00:35 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon, 20 Oct 2014 16:00:34 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 20 Oct 2014 16:00:49 +0200
Message-ID: <54451581.6020409@topic.nl>
Date: Mon, 20 Oct 2014 16:00:33 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <54354CBD.6040506@topic.nl>
	<CAP9ODKpERB+agUBv3-BgPM3JRBQiZ-QKVhONvuSkRFUWi_ZkqQ@mail.gmail.com>
	<54377059.10606@topic.nl>
	<1796874.7cz1rBMpRa@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1796874.7cz1rBMpRa@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Mon, 20 Oct 2014 14:00:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 10/10/2014 05:03 PM, Paul Eggleton wrote:
> Hi Mike,
>
> On Friday 10 October 2014 07:36:25 Mike Looijmans wrote:
>> On 10/10/2014 12:15 AM, Otavio Salvador wrote:
>>> On Thu, Oct 9, 2014 at 4:56 PM, Richard Purdie
>>>
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Thu, 2014-10-09 at 10:16 +0200, Mike Looijmans wrote:
>>>>> =EF=BB=BFIn partial reply to my own question, this has been discussed=
 2 years
>>>>> ago, but apparently nothing ever came out of it.
>>>>>
>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2012-Februa=
ry/
>>>>> 056050.html
>>>>>
>>>>> So once more the request to be able to get sane version strings for g=
it
>>>>> repos. Can we please just move gitpkgv. That's like five minutes work=
,
>>>>> and if anyone (e.g. me) feels like building something better, he or s=
he
>>>>> is free do submit that and get rid of the gitpkgv class once it's
>>>>> obsolete.
>>>>
>>>> I do feel quite strongly that this is something which should get
>>>> improved in the fetcher itself. That is why I've pushed back on the
>>>> patch since if I take it into OE-Core, there is even less incentive to
>>>> fix the real problem...
>>>
>>> Mike I am also an user of gitpkgv but I must to agree with Richard
>>> here. Moving this to OE-Core will just make it worse. It is way better
>>> to prepare a patch and add support for it on the fetcher code of
>>> BitBake.
>>
>> Give me some pointers on what you're talking about here, and I'll be hap=
py
>> to try and implement it. Currently I have no idea as to what is "wrong"
>> with the gitpkgv approach, and I also have no clue as to what it is you
>> want to have implemented in the git fetcher.
>
> The code would go into the fetcher itself i.e. lib/bb/fetch2/git.py and
> lib/bb/fetch2/__init__.py.
>
> I'm not sure whether it would be a case of setting a variable in order to=
 have
> the value of SRCPV within OE (which calls bb.fetch2.get_srcrev() ) return=
 the
> "git describe" style version instead of the current one, or whether we wo=
uld
> preserve the separate GITPKGVTAG variable for that purpose. (The GITPKGV =
case
> is already handled by the current behaviour of SRCPV, right?)
>
> FWIW there is an open bug covering this issue:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2872

I followed that link a few clicks deeper and noticed that Richard Purdie=20
suggested adding another interface method, but I couldn't quite understand=
=20
what he meant here.


I figured that "sortable_revision" was the method that I needed to delve in=
to.=20
However, it turned out that this one is called about 50 times when building=
 a=20
single package, and i cannot really run any git commands at that spot it=20
seems, the current directory is not inside the repo.

So that's a fail (my trial code from git.py with some extra logger output b=
elow).



     def sortable_revision(self, ud, d, name):
         """
         Return a sortable revision number by counting commits in the histo=
ry
         """
		rev =3D self._build_revision(ud, d, name)
		logger.warn("git.sortable_revision url=3D%s" % (ud.url))
		localpath =3D ud.localpath
		rev_file =3D os.path.join(localpath, "oe-gitpkgv_" + rev)
		if not os.path.exists(localpath):
			logger.warn("git.sortable_revision non-existent: %s" % (localpath))
			commits =3D None
		else:
			if not os.path.exists(rev_file) or not os.path.getsize(rev_file):
				from pipes import quote
				commits =3D bb.fetch2.runfetchcmd(
						"git rev-list %s -- 2> /dev/null | wc -l" % (quote(rev)),
						d, quiet=3DTrue).strip().lstrip('0')
				if commits:
					os.unlink(rev_file)
					open(rev_file, "w").write("%d\n" % int(commits))
			else:
				commits =3D open(rev_file, "r").readline(128).strip()
		logger.warn("git.sortable_revision commits=3D%s\n" % (commits))
		if commits:
			return False, "%s+%s" % (commits, rev[:7])
		else:
			return True, str(rev)




Met vriendelijke groet / kind regards,

Mike Looijmans

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


