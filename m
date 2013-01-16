Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1TvYg5-0003VS-BZ; Wed, 16 Jan 2013 20:29:38 +0100
Received: by mail-la0-f46.google.com with SMTP id fq13so1815453lab.33
	for <multiple recipients>; Wed, 16 Jan 2013 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=+aw3FN+C4CK+gx3usUBlcuA9qWTM7mUkKV1pwgjXbMk=;
	b=DQgjP97aavUFAmHtHct+u1HEMmLiD7p91k6B7MUmr2A8WEqPT04LmsmoRCO66dMhFP
	uqsKvU5m2JX8OJCkejXbMulw15cKEHpMO9Own0cx5leMiT+bORJGLDdZyn+32Vcu7wwA
	rSc/fokCFvMcQvQ6PGOlgGhnODEMfVwEEml2TozhPDXzo7Hy2Ym/c70W1Jjyvm6NWfIM
	NAZ/nYkwAD89Ntj6u/7/tV7m6TiEDO05TGsKDwTCDp1h76xUQcHCSYJXhKc1B1aCxW8Q
	98avQChexlM5gsVdxtqq+uHLZCB2U/z2uPObltX+sGuHv4/lmq/Pfo0xtGvHI27VqfRO
	wndQ==
MIME-Version: 1.0
X-Received: by 10.152.114.66 with SMTP id je2mr2180657lab.40.1358363654278;
	Wed, 16 Jan 2013 11:14:14 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.112.79.13 with HTTP; Wed, 16 Jan 2013 11:14:14 -0800 (PST)
Date: Wed, 16 Jan 2013 11:14:14 -0800
X-Google-Sender-Auth: uQOh9zaxJkOtliKtN-0IFaNQ-ts
Message-ID: <CA+YB3raM_MHQ1xc-snZ5vxatgPt0da=NteA+mYjSFkHm+kLazg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 20 November 2012
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
X-List-Received-Date: Wed, 16 Jan 2013 19:29:42 -0000
Content-Type: multipart/alternative; boundary=90e6ba30992616ceb204d36cafbb

--90e6ba30992616ceb204d36cafbb
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
20 November 2012

Attendees: Mark, Paul, Richard
Apologies: Khem, Koen
Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair

___________________________________
2. new issues

 a. RFC for the secondary toolchain (fray)
    how to document as best practice?
        possibly sample secondary toolchain layer as template
        no changes to oe-core, possibly add an include file
-> in progress

 b. RPM and package feeds
        packages_rpm, rootfs_rpm doesn't use Zypper
        fray proposes replacing with SMART after 1.3 release
        smaller footprint, python based
        -> fray will write proposal after 1.3
-> in progress

 c. patchwork queue
    bluelightning did a massive clearout of patchwork, got rid of 3 pages
    a number of oe-classic patches left
    koen notes that git hooks catch only 80% of patches, and then only
for master
    known to fail with accented names
=> koen to go through what is left in patchwork for meta-oe
=> bluelightning to send note to ml re oe-classic patches
-> not discussed

 d. raise ntp with the Yocto Project [RP]
-> not discussed

 e. secondary toolchain document
http://www.openembedded.org/wiki/Adding_a_secondary_toolchain
-> not discussed

 f. wiki
-> bluelightning did much work based on meetings in Barcelona
RP helped by deleting some old information

 g. oe-classic recipe migration status
-> not discussed

 h. FILESDIR & FILESPATH
-> FILESDIR deprecated, time to remove
and prune out the remaining FILESDIR references
 i. SMART replacing zypper
-> in progress
___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. pre/post install scripting (fray)
     holding for 1.4

 c. document whitespace changes to the shell
    RP edited OE style guide with new info, linked to YP
        => fray to update patch guidelines

 d. documentation
    need someone to work on OE wiki pages
        RP, bluelightning, fray to hopefully work on it together @ELCE

___________________________________
4. status

 a. oe-core release
good to go with the branch as it stands now
1.4 is open for development now

 b. infrastructure
    Tom & Martin working on setting up jenkins

 c. 1.4 planning
   PR issues
   pre/post install scripting
   SMART
   systemd into master


________________________________________________________________
Raw Transcript

(9:00:26 AM) fray: I just want to mentioned the 'secondary toolchain'
document
(9:00:33 AM) fray: but I don't think there is anything to discuss there
(9:00:49 AM) fray:
http://www.openembedded.org/wiki/Adding_a_secondary_toolchain
(9:00:52 AM) bluelightning: I wanted to mention the wiki, and
OE-Classic recipe migration status
(9:01:59 AM) ***bluelightning has pinged koen
(9:02:03 AM) fray: It's been added to the wiki -- with a link to an
example layer.  I've not received any comments from the mailing list
on this.. (I don't expect it to be a big topic, unless someone is
really trying to implement a secondary/alternative toolchain..)  note,
this secondary toolchain is not to 'replace' the default toolchain
(the one used to build most of the system) but to provide an
alternative toolchain to perform some special function (such as a
highly op
(9:04:20 AM) RP__: I'd very briefly like to touch on FILESDIR and FILESPATH
(9:06:17 AM) RP__: is khem around?
(9:06:24 AM) ***Jefro was just about to ask that
(9:06:47 AM) bluelightning: he's not said anything here yet
(9:07:00 AM) Jefro: Agenda is now at http://pastebin.com/Cz0faSCS
(9:07:26 AM) Jefro: I left in lingering things from previous meetings
& added those mentioned here plus one from the meeting in Barcelona
(9:07:42 AM) RP__: ok, I'm going to be pushed for time here. Let me
mention the FILES stuff while I have a chance...
(9:07:43 AM) bluelightning: I would move FILESDIR/FILESPATH up the
list since Richard has to leave early
(9:08:02 AM) Jefro: can discuss in any order
(9:08:11 AM) RP__: Basically, FILESDIR is deprecated API and was
replaced with FILESPATH years ago. There is nothing FILESDIR can do
which FILESPATH cannot.
(9:08:32 AM) RP__: I therefore want to prune out the remaining
FILESDIR references. We can leave the support in bitbake for now
(9:08:48 AM) RP__: We only have about 5 references in the core for
FILESDIR. I think this part is an easy decision
(9:09:09 AM) RP__: FILESPATH is tricker. Its a *huge* variable
searching many different locations.
(9:09:24 AM) RP__: Most of them are pointless. I've therefore posted
patches on the list to cut down the list a lot
(9:09:47 AM) RP__: I have one remaining patch which is to remove
several OVERRIDES from the list it searches to, basically leave
MACHINE and DISTRO
(9:10:13 AM) bluelightning: FWIW, some greps of mine over most of the
public layers introducing new recipes reports only a few references to
FILESDIR
(9:10:20 AM) RP__: Nobody puts files in BUILD_ARCH, forcevariable,
libc-xxx or other locations as far as I know
(9:10:47 AM) RP__: The bigger problem will be the FILESPATH change
since I drop PN from it, preferring BPN
(9:10:55 AM) RP__: This did break some -native recipes
(9:11:08 AM) RP__: I suspect we have the bulk of those in the core though
(9:11:46 AM) RP__: Basically, I was looking to the TSC to decide if
this was a good direction to proceed, on grounds of improving
usability and simplifying things
(9:12:08 AM) RP__: You can get the existing behaviour back if you
wanted it though configuration, it just wouldn't be the default any
more
(9:12:14 AM) bluelightning: seems reasonable to me, FWIW
(9:13:14 AM) RP__: fray: the secondary toolchain sounds reasonable
from what we discussed. I need to read it sometime but I doubt I'll
get around to it soon :(
(9:13:37 AM) bluelightning: adding/overriding files is something that
users struggle with; the trouble though is that it's hard to tell
immediately if a file has been picked up or not
(9:14:12 AM) RP__: I have to say bluelightning has done great work on
the OE wiki and it looks much improved. In Barcelona, I tried to help
improve some sections, mostly by deleting seriously dated information
(9:14:43 AM) RP__: bluelightning: there are ways we can improve that
including printing search paths but when the list is two pages long,
its not useful
(9:14:53 AM) bluelightning: right
(9:14:55 AM) fray: Ya, the change seems reasonable to me
(9:15:13 AM) fray: RP__ re secondary toolchain.. I figure when people
need it they'll read it and comment.. otherwise it's just an FYI.. :)
(9:15:27 AM) RP__: On the plus side, with the file checksumming we
know about missing files at parse time which is nice
(9:15:44 AM) RP__: This is the reason we never touched FILESDIR/FILESPATH
before
(9:15:53 AM) RP__: since validation was runtime, now its parse time
(9:16:27 AM) fray: parse time is much better
(9:16:53 AM) RP__: we should probably make it an error now, not a warning
(9:16:58 AM) RP__: maybe an AR for bluelightning? :)
(9:17:13 AM) RP__: In fact I need to head AFK now, sorry about this.
If koen/khem do show up, please let them see my comments above
(9:17:17 AM) fray: my only concern is that I've seen cases where
layers come in and you get those messages -- but it's all items not
being used..
(9:17:28 AM) bluelightning: indeed, I'm not sure we can make it an error
(9:17:30 AM) fray: BTW not against making it an error.. just stating
the one place I've seen it
(9:17:44 AM) RP__: bluelightning: when is it valid to have just a warning?
(9:18:14 AM) RP__: bluelightning: I can't think of any case I've see
where it shouldn't have been an error but perhaps I don't use the
layers you do...
(9:18:22 AM) fray: when the recipe isn't used and the layer creator
was 'lazy'.. AFAIK
(9:18:34 AM) bluelightning: RP__: it's not really valid but it will
create pain where files exist for some configurations (machines,
archs, etc) and not others
(9:18:42 AM) fray: (which is why I'm not against making it an error..)
(9:18:52 AM) RP__: COMPATIBLE_MACHINE/HOST
(9:18:58 AM) fray: ahh, forgot about that case...
(9:19:11 AM) RP__: sorry I do need to go :(
(9:19:14 AM) bluelightning: RP__: yes, just forces people to do that
(9:19:16 AM) bluelightning: cya
(9:19:20 AM) RP__ left the room (quit: Quit: Leaving.).
(9:19:22 AM) fray: later!
(9:19:24 AM) bluelightning: hmm
(9:19:50 AM) bluelightning: well we have two people here (plus Jefro),
this is not really a meeting...
(9:19:52 AM) fray: do we still have a quorum?
(9:20:05 AM) fray: yup.. we'll need to adjourn.. is there naything
informal that we should mention?
(9:20:18 AM) fray: we could do SMART status for the meeting minutes..
(9:20:28 AM) bluelightning: yeah we should do that
(9:20:30 AM) Jefro: technically, no quorum
(9:20:47 AM) fray: yup.. so officially meeting over.. unofficially
we'll do smart status and call it
(9:20:50 AM) Jefro: (what's SMART status? I thought SMART was a hard
drive monitoring tool)
(9:20:59 AM) fray: smartass..
(9:21:00 AM) bluelightning: Jefro: please make a note that people need
to turn up or tell people they're not turning up in advance :/
(9:21:07 AM) fray: SMART is replacing Zypper..
(9:21:13 AM) Jefro: bluelightning will do
(9:21:18 AM) Jefro: fray ah yes, I remember now
(9:21:20 AM) bluelightning: it's Smart not SMART ;)
(9:21:29 AM) bluelightning: (according to their website)
(9:21:36 AM) fray: We have the first version of rpm support for python
working (and in), and smart itself is in, and at least passing basic
unit tests..
(9:21:51 AM) fray: work in progress -- recommends support.. and
replacing the rootfs install items
(9:21:58 AM) fray: bluelightning did I miss anything?
(9:22:29 AM) bluelightning: it can be built for native and tested in a
devshell - instructions for the interested:
https://wiki.yoctoproject.org/wiki/Smart
(9:22:45 AM) bluelightning: other than that I think that covers it
(9:22:45 AM) fray: yup


--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba30992616ceb204d36cafbb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">OpenEmbedded Technical Steering Committee</span><br style=3D"font-family:=
arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-seri=
f;font-size:13px">20 November 2012</span><br style=3D"font-family:arial,san=
s-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">Attendees: Mark, Paul, Richard</=
span><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">Apologies: Khem, Koen</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">Notes: Jefro</s=
pan><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">__________________________=
____</span><span style=3D"font-family:arial,sans-serif;font-size:13px">____=
__________________________</span><span style=3D"font-family:arial,sans-seri=
f;font-size:13px">____</span><br style=3D"font-family:arial,sans-serif;font=
-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">Agenda &amp; Re=
sults</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">1. pick a chair</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">______________________________</=
span><span style=3D"font-family:arial,sans-serif;font-size:13px">_____</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">2. new issues</=
span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D=
"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ar=
ial,sans-serif;font-size:13px">=A0a. RFC for the secondary toolchain (fray)=
</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 how to =
document as best practice?</span><br style=3D"font-family:arial,sans-serif;=
font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px"=
>=A0 =A0 =A0 =A0 possibly sample secondary toolchain layer as template</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 =A0 =A0=
 no changes to oe-core, possibly add an include file</span><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,=
sans-serif;font-size:13px">-&gt; in progress</span><br style=3D"font-family=
:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0b. RPM and package feeds</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"=
font-family:arial,sans-serif;font-size:13px">=A0 =A0 =A0 =A0 packages_rpm, =
rootfs_rpm doesn&#39;t use Zypper</span><br style=3D"font-family:arial,sans=
-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 =A0 =A0=
 fray proposes replacing with SMART after 1.3 release</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial=
,sans-serif;font-size:13px">=A0 =A0 =A0 =A0 smaller footprint, python based=
</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 =A0 =A0=
 -&gt; fray will write proposal after 1.3</span><br style=3D"font-family:ar=
ial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;=
font-size:13px">-&gt; in progress</span><br style=3D"font-family:arial,sans=
-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0c. patchwork queue</span><br =
style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-f=
amily:arial,sans-serif;font-size:13px">=A0 =A0 bluelightning did a massive =
clearout of patchwork, got rid of 3 pages</span><br style=3D"font-family:ar=
ial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 a numbe=
r of oe-classic patches left</span><br style=3D"font-family:arial,sans-seri=
f;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13p=
x">=A0 =A0 koen notes that git hooks catch only 80% of patches, and then on=
ly</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">for master</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"=
font-family:arial,sans-serif;font-size:13px">=A0 =A0 known to fail with acc=
ented names</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
>
<span style=3D"font-family:arial,sans-serif;font-size:13px">=3D&gt; koen to=
 go through what is left in patchwork for meta-oe</span><br style=3D"font-f=
amily:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,san=
s-serif;font-size:13px">=3D&gt; bluelightning to send note to ml re oe-clas=
sic patches</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
>
<span style=3D"font-family:arial,sans-serif;font-size:13px">-&gt; not discu=
ssed</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">=A0d. raise ntp with the Yocto Project=
 [RP]</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">-&gt; not discu=
ssed</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">=A0e. secondary toolchain document</sp=
an><br style=3D"font-family:arial,sans-serif;font-size:13px">
<a href=3D"http://www.openembedded.org/wiki/Adding_a_secondary_toolchain" t=
arget=3D"_blank" style=3D"font-family:arial,sans-serif;font-size:13px">http=
://www.openembedded.org/wiki/Adding_a_secondary_toolchain</a><br style=3D"f=
ont-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">-&gt; not discu=
ssed</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">=A0f. wiki</span><br style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">-&gt; bluelight=
ning did much work based on meetings in Barcelona</span><br style=3D"font-f=
amily:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,san=
s-serif;font-size:13px">RP helped by deleting some old information</span><b=
r style=3D"font-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0g. oe-classic recipe migratio=
n status</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><s=
pan style=3D"font-family:arial,sans-serif;font-size:13px">-&gt; not discuss=
ed</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0h. FILESDIR &amp; FILESPATH</=
span><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">-&gt; FILESDIR deprecated,=
 time to remove</span><br style=3D"font-family:arial,sans-serif;font-size:1=
3px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">and prune out t=
he remaining FILESDIR references</span><br style=3D"font-family:arial,sans-=
serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size=
:13px">=A0i. SMART replacing zypper</span><br style=3D"font-family:arial,sa=
ns-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">-&gt; in progre=
ss</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><span st=
yle=3D"font-family:arial,sans-serif;font-size:13px">_______________________=
_______</span><span style=3D"font-family:arial,sans-serif;font-size:13px">_=
____</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">3. lingering is=
sues</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">=A0a. raise awareness of &quot;janitor=
&quot; list, QA &quot;bugs&quot;</span><br style=3D"font-family:arial,sans-=
serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0b. pre/post install scripting=
 (fray)</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><sp=
an style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 =A0holding=
 for 1.4</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0c. document whitespace change=
s to the shell</span><br style=3D"font-family:arial,sans-serif;font-size:13=
px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 RP edit=
ed OE style guide with new info, linked to YP</span><br style=3D"font-famil=
y:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-se=
rif;font-size:13px">=A0 =A0 =A0 =A0 =3D&gt; fray to update patch guidelines=
</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0d. documentation</span><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">=A0 =A0 need someone to work on OE wik=
i pages</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0 =A0 =A0=
 RP, bluelightning, fray to hopefully work on it together @ELCE</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">_______________=
_______________</span><span style=3D"font-family:arial,sans-serif;font-size=
:13px">_____</span><br style=3D"font-family:arial,sans-serif;font-size:13px=
">
<span style=3D"font-family:arial,sans-serif;font-size:13px">4. status</span=
><br style=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,=
sans-serif;font-size:13px">=A0a. oe-core release</span><br style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">good to go with=
 the branch as it stands now</span><br style=3D"font-family:arial,sans-seri=
f;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13p=
x">1.4 is open for development now</span><br style=3D"font-family:arial,san=
s-serif;font-size:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0b. infrastructure</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">=A0 =A0 Tom &amp; Martin working on s=
etting up jenkins</span><br style=3D"font-family:arial,sans-serif;font-size=
:13px">
<br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">=A0c. 1.4 planning</span><br sty=
le=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fami=
ly:arial,sans-serif;font-size:13px">=A0 =A0PR issues</span><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0pre/post=
 install scripting</span><br style=3D"font-family:arial,sans-serif;font-siz=
e:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0=
SMART</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">=A0 =A0systemd =
into master</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
><br style=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">_______________=
_______________</span><span style=3D"font-family:arial,sans-serif;font-size=
:13px">______________________________</span><span style=3D"font-family:aria=
l,sans-serif;font-size:13px">____</span><br style=3D"font-family:arial,sans=
-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">Raw Transcript<=
/span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">(9:00:26 AM) fray: I just want to mention=
ed the &#39;secondary toolchain&#39; document</span><br style=3D"font-famil=
y:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:00:33 AM) fr=
ay: but I don&#39;t think there is anything to discuss there</span><br styl=
e=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-famil=
y:arial,sans-serif;font-size:13px">(9:00:49 AM) fray:=A0</span><a href=3D"h=
ttp://www.openembedded.org/wiki/Adding_a_secondary_toolchain" target=3D"_bl=
ank" style=3D"font-family:arial,sans-serif;font-size:13px">http://www.opene=
mbedded.org/wiki/Adding_a_secondary_toolchain</a><br style=3D"font-family:a=
rial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:00:52 AM) bl=
uelightning: I wanted to mention the wiki, and</span><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-s=
erif;font-size:13px">OE-Classic recipe migration status</span><br style=3D"=
font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:01:59 AM) **=
*bluelightning has pinged koen</span><br style=3D"font-family:arial,sans-se=
rif;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:1=
3px">(9:02:03 AM) fray: It&#39;s been added to the wiki -- with a link to a=
n</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">example layer. =
=A0I&#39;ve not received any comments from the mailing list</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">on this.. (I don&#39;t expect it to be a =
big topic, unless someone is</span><br style=3D"font-family:arial,sans-seri=
f;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">really trying t=
o implement a secondary/alternative toolchain..) =A0note,</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">this secondary toolchain is not to &#39;r=
eplace&#39; the default toolchain</span><br style=3D"font-family:arial,sans=
-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(the one used t=
o build most of the system) but to provide an</span><br style=3D"font-famil=
y:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-se=
rif;font-size:13px">alternative toolchain to perform some special function =
(such as a</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">highly op</span=
><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"f=
ont-family:arial,sans-serif;font-size:13px">(9:04:20 AM) RP__: I&#39;d very=
 briefly like to touch on FILESDIR and FILESPATH</span><br style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:06:17 AM) RP=
__: is khem around?</span><br style=3D"font-family:arial,sans-serif;font-si=
ze:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:06:=
24 AM) ***Jefro was just about to ask that</span><br style=3D"font-family:a=
rial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:06:47 AM) bl=
uelightning: he&#39;s not said anything here yet</span><br style=3D"font-fa=
mily:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans=
-serif;font-size:13px">(9:07:00 AM) Jefro: Agenda is now at=A0</span><a hre=
f=3D"http://pastebin.com/Cz0faSCS" target=3D"_blank" style=3D"font-family:a=
rial,sans-serif;font-size:13px">http://pastebin.com/Cz0faSCS</a><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:07:26 AM) Je=
fro: I left in lingering things from previous meetings</span><br style=3D"f=
ont-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:aria=
l,sans-serif;font-size:13px">&amp; added those mentioned here plus one from=
 the meeting in Barcelona</span><br style=3D"font-family:arial,sans-serif;f=
ont-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:07:42 AM) RP=
__: ok, I&#39;m going to be pushed for time here. Let me</span><br style=3D=
"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ar=
ial,sans-serif;font-size:13px">mention the FILES stuff while I have a chanc=
e...</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:07:43 AM) bl=
uelightning: I would move FILESDIR/FILESPATH up the</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,s=
ans-serif;font-size:13px">list since Richard has to leave early</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:08:02 AM) Je=
fro: can discuss in any order</span><br style=3D"font-family:arial,sans-ser=
if;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13=
px">(9:08:11 AM) RP__: Basically, FILESDIR is deprecated API and was</span>=
<br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">replaced with F=
ILESPATH years ago. There is nothing FILESDIR can do</span><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,=
sans-serif;font-size:13px">which FILESPATH cannot.</span><br style=3D"font-=
family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:08:32 AM) RP=
__: I therefore want to prune out the remaining</span><br style=3D"font-fam=
ily:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-=
serif;font-size:13px">FILESDIR references. We can leave the support in bitb=
ake for now</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
>
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:08:48 AM) RP=
__: We only have about 5 references in the core for</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,s=
ans-serif;font-size:13px">FILESDIR. I think this part is an easy decision</=
span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:09:09 AM) RP=
__: FILESPATH is tricker. Its a *huge* variable</span><br style=3D"font-fam=
ily:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-=
serif;font-size:13px">searching many different locations.</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:09:24 AM) RP=
__: Most of them are pointless. I&#39;ve therefore posted</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">patches on the list to cut down the list =
a lot</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:09:47 AM) RP=
__: I have one remaining patch which is to remove</span><br style=3D"font-f=
amily:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,san=
s-serif;font-size:13px">several OVERRIDES from the list it searches to, bas=
ically leave</span><br style=3D"font-family:arial,sans-serif;font-size:13px=
">
<span style=3D"font-family:arial,sans-serif;font-size:13px">MACHINE and DIS=
TRO</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><span s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">(9:10:13 AM) bluelight=
ning: FWIW, some greps of mine over most of the</span><br style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">public layers i=
ntroducing new recipes reports only a few references to</span><br style=3D"=
font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ari=
al,sans-serif;font-size:13px">FILESDIR</span><br style=3D"font-family:arial=
,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:10:20 AM) RP=
__: Nobody puts files in BUILD_ARCH, forcevariable,</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,s=
ans-serif;font-size:13px">libc-xxx or other locations as far as I know</spa=
n><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:10:47 AM) RP=
__: The bigger problem will be the FILESPATH change</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,s=
ans-serif;font-size:13px">since I drop PN from it, preferring BPN</span><br=
 style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:10:55 AM) RP=
__: This did break some -native recipes</span><br style=3D"font-family:aria=
l,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;fo=
nt-size:13px">(9:11:08 AM) RP__: I suspect we have the bulk of those in the=
 core though</span><br style=3D"font-family:arial,sans-serif;font-size:13px=
">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:11:46 AM) RP=
__: Basically, I was looking to the TSC to decide if</span><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,=
sans-serif;font-size:13px">this was a good direction to proceed, on grounds=
 of improving</span><br style=3D"font-family:arial,sans-serif;font-size:13p=
x">
<span style=3D"font-family:arial,sans-serif;font-size:13px">usability and s=
implifying things</span><br style=3D"font-family:arial,sans-serif;font-size=
:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:12:08=
 AM) RP__: You can get the existing behaviour back if you</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">wanted it thoug=
h configuration, it just wouldn&#39;t be the default any</span><br style=3D=
"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ar=
ial,sans-serif;font-size:13px">more</span><br style=3D"font-family:arial,sa=
ns-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:12:14 AM) bl=
uelightning: seems reasonable to me, FWIW</span><br style=3D"font-family:ar=
ial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;=
font-size:13px">(9:13:14 AM) RP__: fray: the secondary toolchain sounds rea=
sonable</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">from what we di=
scussed. I need to read it sometime but I doubt I&#39;ll</span><br style=3D=
"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ar=
ial,sans-serif;font-size:13px">get around to it soon :(</span><br style=3D"=
font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:13:37 AM) bl=
uelightning: adding/overriding files is something that</span><br style=3D"f=
ont-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:aria=
l,sans-serif;font-size:13px">users struggle with; the trouble though is tha=
t it&#39;s hard to tell</span><br style=3D"font-family:arial,sans-serif;fon=
t-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">immediately if =
a file has been picked up or not</span><br style=3D"font-family:arial,sans-=
serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size=
:13px">(9:14:12 AM) RP__: I have to say bluelightning has done great work o=
n</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">the OE wiki and=
 it looks much improved. In Barcelona, I tried to help</span><br style=3D"f=
ont-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:aria=
l,sans-serif;font-size:13px">improve some sections, mostly by deleting seri=
ously dated information</span><br style=3D"font-family:arial,sans-serif;fon=
t-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:14:43 AM) RP=
__: bluelightning: there are ways we can improve that</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial=
,sans-serif;font-size:13px">including printing search paths but when the li=
st is two pages long,</span><br style=3D"font-family:arial,sans-serif;font-=
size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">its not useful<=
/span><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">(9:14:53 AM) bluelightning=
: right</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:14:55 AM) fr=
ay: Ya, the change seems reasonable to me</span><br style=3D"font-family:ar=
ial,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;=
font-size:13px">(9:15:13 AM) fray: RP__ re secondary toolchain.. I figure w=
hen people</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">need it they&#3=
9;ll read it and comment.. otherwise it&#39;s just an FYI.. :)</span><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">(9:15:27 AM) RP__: On the plus side, w=
ith the file checksumming we</span><br style=3D"font-family:arial,sans-seri=
f;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">know about miss=
ing files at parse time which is nice</span><br style=3D"font-family:arial,=
sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;font=
-size:13px">(9:15:44 AM) RP__: This is the reason we never touched FILESDIR=
/FILESPATH before</span><br style=3D"font-family:arial,sans-serif;font-size=
:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:15:53 AM) RP=
__: since validation was runtime, now its parse time</span><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,=
sans-serif;font-size:13px">(9:16:27 AM) fray: parse time is much better</sp=
an><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:16:53 AM) RP=
__: we should probably make it an error now, not a warning</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">(9:16:58 AM) RP__: maybe an AR for blueli=
ghtning? :)</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
>
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:17:13 AM) RP=
__: In fact I need to head AFK now, sorry about this.</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial=
,sans-serif;font-size:13px">If koen/khem do show up, please let them see my=
 comments above</span><br style=3D"font-family:arial,sans-serif;font-size:1=
3px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:17:17 AM) fr=
ay: my only concern is that I&#39;ve seen cases where</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial=
,sans-serif;font-size:13px">layers come in and you get those messages -- bu=
t it&#39;s all items not</span><br style=3D"font-family:arial,sans-serif;fo=
nt-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">being used..</s=
pan><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">(9:17:28 AM) bluelightning=
: indeed, I&#39;m not sure we can make it an error</span><br style=3D"font-=
family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:17:30 AM) fr=
ay: BTW not against making it an error.. just stating</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial=
,sans-serif;font-size:13px">the one place I&#39;ve seen it</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:17:44 AM) RP=
__: bluelightning: when is it valid to have just a warning?</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">(9:18:14 AM) RP__: bluelightning: I can&#=
39;t think of any case I&#39;ve see</span><br style=3D"font-family:arial,sa=
ns-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">where it should=
n&#39;t have been an error but perhaps I don&#39;t use the</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">layers you do...</span><br style=3D"font-=
family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:18:22 AM) fr=
ay: when the recipe isn&#39;t used and the layer creator</span><br style=3D=
"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ar=
ial,sans-serif;font-size:13px">was &#39;lazy&#39;.. AFAIK</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:18:34 AM) bl=
uelightning: RP__: it&#39;s not really valid but it will</span><br style=3D=
"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ar=
ial,sans-serif;font-size:13px">create pain where files exist for some confi=
gurations (machines,</span><br style=3D"font-family:arial,sans-serif;font-s=
ize:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">archs, etc) and=
 not others</span><br style=3D"font-family:arial,sans-serif;font-size:13px"=
><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:18:42 AM) f=
ray: (which is why I&#39;m not against making it an error..)</span><br styl=
e=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:18:52 AM) RP=
__: COMPATIBLE_MACHINE/HOST</span><br style=3D"font-family:arial,sans-serif=
;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">(9:18:58 AM) fray: ahh, forgot about that case...</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:11 AM) RP=
__: sorry I do need to go :(</span><br style=3D"font-family:arial,sans-seri=
f;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13p=
x">(9:19:14 AM) bluelightning: RP__: yes, just forces people to do that</sp=
an><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:16 AM) bl=
uelightning: cya</span><br style=3D"font-family:arial,sans-serif;font-size:=
13px"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:20 =
AM) RP__ left the room (quit: Quit: Leaving.).</span><br style=3D"font-fami=
ly:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:22 AM) fr=
ay: later!</span><br style=3D"font-family:arial,sans-serif;font-size:13px">=
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:24 AM) bl=
uelightning: hmm</span><br style=3D"font-family:arial,sans-serif;font-size:=
13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:50 AM) bl=
uelightning: well we have two people here (plus Jefro),</span><br style=3D"=
font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ari=
al,sans-serif;font-size:13px">this is not really a meeting...</span><br sty=
le=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:19:52 AM) fr=
ay: do we still have a quorum?</span><br style=3D"font-family:arial,sans-se=
rif;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:1=
3px">(9:20:05 AM) fray: yup.. we&#39;ll need to adjourn.. is there naything=
</span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">informal that w=
e should mention?</span><br style=3D"font-family:arial,sans-serif;font-size=
:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:20:18=
 AM) fray: we could do SMART status for the meeting minutes..</span><br sty=
le=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:20:28 AM) bl=
uelightning: yeah we should do that</span><br style=3D"font-family:arial,sa=
ns-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;font-s=
ize:13px">(9:20:30 AM) Jefro: technically, no quorum</span><br style=3D"fon=
t-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:20:47 AM) fr=
ay: yup.. so officially meeting over.. unofficially</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,s=
ans-serif;font-size:13px">we&#39;ll do smart status and call it</span><br s=
tyle=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:20:50 AM) Je=
fro: (what&#39;s SMART status? I thought SMART was a hard</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family=
:arial,sans-serif;font-size:13px">drive monitoring tool)</span><br style=3D=
"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:20:59 AM) fr=
ay: smartass..</span><br style=3D"font-family:arial,sans-serif;font-size:13=
px"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:21:00 AM=
) bluelightning: Jefro: please make a note that people need</span><br style=
=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">to turn up or t=
ell people they&#39;re not turning up in advance :/</span><br style=3D"font=
-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:arial,s=
ans-serif;font-size:13px">(9:21:07 AM) fray: SMART is replacing Zypper..</s=
pan><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:21:13 AM) Je=
fro: bluelightning will do</span><br style=3D"font-family:arial,sans-serif;=
font-size:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px"=
>(9:21:18 AM) Jefro: fray ah yes, I remember now</span><br style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:21:20 AM) bl=
uelightning: it&#39;s Smart not SMART ;)</span><br style=3D"font-family:ari=
al,sans-serif;font-size:13px"><span style=3D"font-family:arial,sans-serif;f=
ont-size:13px">(9:21:29 AM) bluelightning: (according to their website)</sp=
an><br style=3D"font-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:21:36 AM) fr=
ay: We have the first version of rpm support for python</span><br style=3D"=
font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ari=
al,sans-serif;font-size:13px">working (and in), and smart itself is in, and=
 at least passing basic</span><br style=3D"font-family:arial,sans-serif;fon=
t-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">unit tests..</s=
pan><br style=3D"font-family:arial,sans-serif;font-size:13px"><span style=
=3D"font-family:arial,sans-serif;font-size:13px">(9:21:51 AM) fray: work in=
 progress -- recommends support.. and</span><br style=3D"font-family:arial,=
sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">replacing the r=
ootfs install items</span><br style=3D"font-family:arial,sans-serif;font-si=
ze:13px"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:21:=
58 AM) fray: bluelightning did I miss anything?</span><br style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:22:29 AM) bl=
uelightning: it can be built for native and tested in a</span><br style=3D"=
font-family:arial,sans-serif;font-size:13px"><span style=3D"font-family:ari=
al,sans-serif;font-size:13px">devshell - instructions for the interested:</=
span><br style=3D"font-family:arial,sans-serif;font-size:13px">
<a href=3D"https://wiki.yoctoproject.org/wiki/Smart" target=3D"_blank" styl=
e=3D"font-family:arial,sans-serif;font-size:13px">https://wiki.yoctoproject=
.org/wiki/Smart</a><br style=3D"font-family:arial,sans-serif;font-size:13px=
"><span style=3D"font-family:arial,sans-serif;font-size:13px">(9:22:45 AM) =
bluelightning: other than that I think that covers it</span><br style=3D"fo=
nt-family:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">(9:22:45 AM) fr=
ay: yup</span><br style=3D"font-family:arial,sans-serif;font-size:13px"><br=
 style=3D"font-family:arial,sans-serif;font-size:13px"><br style=3D"font-fa=
mily:arial,sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">--</span><br st=
yle=3D"font-family:arial,sans-serif;font-size:13px"><span style=3D"font-fam=
ily:arial,sans-serif;font-size:13px">Jeff Osier-Mixon=A0</span><a href=3D"h=
ttp://jefro.net/blog" target=3D"_blank" style=3D"font-family:arial,sans-ser=
if;font-size:13px">http://jefro.net/blog</a><br style=3D"font-family:arial,=
sans-serif;font-size:13px">
<span style=3D"font-family:arial,sans-serif;font-size:13px">Yocto Project C=
ommunity Manager @Intel=A0</span><a href=3D"http://yoctoproject.org/" targe=
t=3D"_blank" style=3D"font-family:arial,sans-serif;font-size:13px">http://y=
octoproject.org</a><br>

</div>

--90e6ba30992616ceb204d36cafbb--
