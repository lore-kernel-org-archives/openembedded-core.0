Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75FEC7D200
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 22:14:57 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id f8so6429069edv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 14:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3X7DB32gtCmhC7sBLXW81Bo6oTnsJL69lNcnMTbLhLg=;
	b=eChf2AjpSKFpCUnYzVwMpiNUf+fmviiqL23QC+kYMrqfnpH6BjpShh2m+w9p397xhA
	RYk98FfW697SeGcvpEPqfT/rd1cZwsF+F6AqSkOCO8ZDxglSbUWmvuygLK7k6Q8Z/J9Z
	kH+5ZmYTA66vYVE6EeTAjtelOLU+eE4nrxr+phzK0689oSdXanWRiuT09FF4rXmzlcVK
	lEOMD2UCIVkE6+ODNNSvWEmgVhuakdahldywhiZc9mDWb1dNojkUsgHtM0tvR2hep21i
	NSVqxRK1CvF0ckoLcJvSeg9NRSUu5W0ZTWsRGJAJ6FuQ8nyUKXP5FgVEPpKi8wpA7RsG
	FmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3X7DB32gtCmhC7sBLXW81Bo6oTnsJL69lNcnMTbLhLg=;
	b=E2WfQvgFgGe3j94eZjSm5BcYgDvpPXfLwqqdQ1tyxbBah7yHTqz+cw1nCCgjkDJD9B
	tQGSbrrd04VuahBe2ZbKu3JIHWXLtJST5yJvLDi8BXWznN6K26t/iG/qMX2h7pcR6aPu
	kBIeBAqCJO4RqNz75LQzd6a2MPmQ/88YX5CCPvIQXM8tB9SD1C6NwQWH7kEZ1nIWS1iz
	+1b048V5tWyB4IW2nRZfx2HG+dUNPhB3/AuPXtSq0SLSRxAAH5dedldht6S4TLW9Hern
	TPLhx8yrIxcmjP/OaMrlAdywdNyHG8BSc5u8Ovr6VQWRpj8dkqDfpXHHxdT4xhSq2yXl
	gAOg==
X-Gm-Message-State: APjAAAWvXIMFZVPtsVe4mxpFKcJWL+NRUooTGrKxhO9MsaLOBd6bVgtW
	yQLABKt1QNQay+SGMGnmgDSKU63/YXKiH2m4K/A=
X-Google-Smtp-Source: APXvYqxIXbrImgmColKlVzaAuBpzW/rqHcK/ucu8wug9Yn42kiqUdSON79fZ4ogz8w1sON44ISlA814rUZ//putHyuY=
X-Received: by 2002:a17:906:4814:: with SMTP id
	w20mr11903490ejq.9.1576793697954; 
	Thu, 19 Dec 2019 14:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20191219183759.3122153-1-JPEWhacker@gmail.com>
	<CADkTA4OMM33MdUyup93ga3HGY96WHJtSvLRLWw=YtQSejQ=0gQ@mail.gmail.com>
	<9365317d-d1d5-33f9-6769-14bf8af5a7a4@gmail.com>
	<CADkTA4OBW-n0ki0HsbS1xrSX9ehDawboieMCxOMeyEhH_2=mMw@mail.gmail.com>
	<CAJdd5GZF4HT_UOkYdOMVGMtp2z_A5bCeWW3bEG9+aU6RgeDyQw@mail.gmail.com>
	<CADkTA4N_P0B+GrwUumub+dFCM3mDEb5NMSb-JpUJN+7zK9n28Q@mail.gmail.com>
	<969ab908-f227-7e8c-2467-3e1ac72d98da@gmail.com>
In-Reply-To: <969ab908-f227-7e8c-2467-3e1ac72d98da@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Dec 2019 17:14:46 -0500
Message-ID: <CADkTA4PZMTpYXVn8opms9Z08qSJxmmwPLmU1YehnGsgk-x4Q2g@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Apply patches from BSP
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
X-List-Received-Date: Thu, 19 Dec 2019 22:14:57 -0000
X-Groupsio-MsgNum: 132793
Content-Type: multipart/mixed; boundary="000000000000404de7059a15e406"

--000000000000404de7059a15e406
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 19, 2019 at 4:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
> On 12/19/19 3:18 PM, Bruce Ashfield wrote:
> > On Thu, Dec 19, 2019 at 3:32 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >> On Thu, Dec 19, 2019 at 1:30 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>> On Thu, Dec 19, 2019 at 1:53 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >>>>
> >>>> On 12/19/19 12:45 PM, Bruce Ashfield wrote:
> >>>>> On Thu, Dec 19, 2019 at 1:38 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >>>>>> 0f698dfd1c8 ("kernel-yocto: streamline patch, configuration and audit
> >>>>>> phases") appears to have inadvertently broken support for BSP .scc files
> >>>>>> to provide patches for the kernel. Restore this behavior by adding
> >>>>>> $bsp_definition to the list of files processed for patches.
> >>>>>> Additionally, the logic can be simplified now that the same elements are
> >>>>>> used for both configuration fragments and patches
> >>>>> Unfortunately no, we can't do this.
> >>>>>
> >>>>> It would reapply all the patches that are already integrated into the
> >>>>> tree, and that distinction is the key part of that change.
> >>>>>
> >>>>> What exactly are you trying to do ? Define a userspace BSP ? If so,
> >>>>> there are examples of this and I can dig them up and send them along.
> >>>> We have a lot of boards running different SoCs (each with a different
> >>>> vendor provided kernel) and we are trying to keep our sanity managing
> >>>> all of the by using a metadata repo. So for example, we have a recipe
> >>>> that pulls in vendor A's kernel directly from the upstream source, then
> >>>> our local metadata repo which provides the scc files we need to
> >>>> configure that repo. Inevitably, we end up needing to patch these
> >>>> kernels, so I was hoping that we could provide the patches in the
> >>>> metadata repo and add them to the BSP .scc file, but that wasn't working.
> >>>>
> >>> Right! It does make sense to keep the configs and patches together in
> >>> that meta data repo.
> >>>
> >>> So you have your own kmeta repo, and that's where the BSP definitions
> >>> that are being searched and found. Are those definitions completely
> >>> standalone, or are they including some of the common yocto ktype
> >>> definitions ? (It makes a difference to how they can be included).
> >> I think they are standalone (e.g. they don't include any of the ktype files).
> >>
> >>
> >>> I explained the details of the behaviour in an email on Oct 9th, with
> >>> the title: "[yocto] Kernel patches pulled from BSP definition file are
> >>> not applied.", so I won't repeat that long description here .. except
> >>> to say that it is working as intended (but that doesn't mean it is set
> >>> in stone .. see below ..). And yes, there are doc updates that need to
> >>> happen for this to more clearly explain the design and options.
> >>>
> >>> That being said, there are a couple of things that can be done, and
> >>> one that works right now:
> >>>
> >>> - The BSP definition SCC needs to be on the SRC_URI itself (as I
> >>> describe in that other email), if your kernel recipe's have different
> >>> names, that's doable. If they are under a common recipe, that of
> >>> course would be harder (but you could use a variable for the MACHINE
> >>> and have it work that way).
> >> Does that mean the BSP scc files need to be moved from our metadata
> >> repo to live alongside the recipe, or is there some special sauce that
> >> allows the scc to be specified in SRC_URI, but pulled from our kmeta
> >> repo?
> > At the moment, yes.  Since you need to specify it in SRC_URI where the
> > fetcher can find it (obviously :D), which implies that it isn't in
> > that separate kernel meta repository.
> >
> > What, if anything, do you currently have on your SRC_URI ? Just the
> > kernel repo and your kernel meta data repo ?
>
> Yes, that is all we have.
>
> >
> > Let me see if I can come up with a simple way (probably patch) to avoid that.
>
> That would be great! Thanks.
>

Attached is my proposed solution. Hopefully the commit log is detailed
enough to explain what I'm trying to do :D

I've only tested that it doesn't break a standard BSP build, so let me
know if this solves your use case, and I'll run some additional tests
and send it to the list.

Bruce

> >
> > Bruce
> >
> >>> That's the one that works now.
> >>>
> >>> A second option would be if I inject some logic to differentiate an
> >>> integrated BSP versus one that requires patching. That's a slippery
> >>> slope back into the complex logic that used to be in place, but I can
> >>> think of a few viable ways to do it.
> >>>
> >>> Definitely a use case we can support, it'll just take some tweaking.
> >>>
> >>> Cheers,
> >>>
> >>> Bruce
> >>>
> >>>
> >>> Bruce
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>>> Bruce
> >>>>>
> >>>>>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >>>>>> ---
> >>>>>>    meta/classes/kernel-yocto.bbclass | 7 ++-----
> >>>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
> >>>>>>
> >>>>>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> >>>>>> index ed9bcfa57c..08c02a8f50 100644
> >>>>>> --- a/meta/classes/kernel-yocto.bbclass
> >>>>>> +++ b/meta/classes/kernel-yocto.bbclass
> >>>>>> @@ -193,12 +193,9 @@ do_kernel_metadata() {
> >>>>>>                   if [ $? -ne 0 ]; then
> >>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >>>>>>                   fi
> >>>>>> -       fi
> >>>>>>
> >>>>>> -       # run2: only generate patches for elements that have been passed on the SRC_URI
> >>>>>> -       elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
> >>>>>> -       if [ -n "${elements}" ]; then
> >>>>>> -               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
> >>>>>> +               # run2: generate patches
> >>>>>> +               scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> >>>>>>                   if [ $? -ne 0 ]; then
> >>>>>>                           bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >>>>>>                   fi
> >>>>>> --
> >>>>>> 2.23.0
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-core mailing list
> >>>>>> Openembedded-core@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000404de7059a15e406
Content-Type: application/octet-stream; 
	name="0001-kernel-yocto-allow-external-aka-non-integrated-BSPs-.patch"
Content-Disposition: attachment; 
	filename="0001-kernel-yocto-allow-external-aka-non-integrated-BSPs-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k4da8j7i0>
X-Attachment-Id: f_k4da8j7i0

RnJvbSA0MzgzZGFjMjY1MzZjYjRjMjZmMzk5ZWRmYTdmYWEwODI1Yzg0Y2VmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPgpEYXRlOiBUaHUsIDE5IERlYyAyMDE5IDE3OjA3OjE4IC0wNTAwClN1YmplY3Q6IFtQQVRD
SF0ga2VybmVsLXlvY3RvOiBhbGxvdyBleHRlcm5hbCAoYWthIG5vbi1pbnRlZ3JhdGVkKSBCU1Bz
IHRvCiBzdXBwbHkgcGF0Y2hlcwoKQnkgZGVmYXVsdCwgb25seSBleHBsaWNpdGx5IHNwZWNpZmll
ZCAuc2NjIGZpbGVzIG9yIHBhdGNoZXMgYXJlIGFwcGxpZWQKdG8gYSBCU1AgYXMgcGFydCBvZiB0
aGUgcGF0Y2hpbmcgcGhhc2UuIFRoaXMgYWxsb3dzIHRoZSByZWZlcmVuY2UgQlNQcwp0byBiZSBp
bnRlZ3JhdGVkIGludG8gYSBrZXJuZWwgdHJlZSwgYW5kIHVzZSB0aGUgc2FtZSBtZXRhIGRhdGEg
Zm9yIHRyZWUKZ2VuZXJhdGlvbiBhbmQgZm9yIHJ1bnRpbWUgYnVpbGRpbmcuIEl0IGFsc28gZ3Jl
YXRseSBzaW1wbGllcyB0aGUKcHJvY2Vzc2luZyBvZiBrZXJuZWwgbWV0YSBkYXRhLgoKVGhhdCBi
ZWluZyBzYWlkLCBpZiBhbiBleHRlcm5hbCAoYW5kIGZ1bGx5IHN0YW5kYWxvbmUpIGttZXRhIHJl
cG9zaXRvcnkKaXMgdXNlZCwgaXQgdmVyeSB3ZWxsIG1heSBjb250YWluIGJvdGggcGF0Y2hlcyBh
bmQgY29uZmlndXJhdGlvbi4gVG8KYWxsb3cgdGhlIEJTUCBkZWZpbml0aW9uIHRvIHN1cHBseSBw
YXRjaGVzIGFuZCBjb25maWcsIHdlIGludHJvZHVjZSBhCm5ldyBrZXJuZWwgbWV0YSBkYXRhIGRl
ZmluaXRpb246CgogIGRlZmluZSBLTUVUQV9FWFRFUk5BTF9CU1AgdAoKVGhpcyBjYW4gYmUgc2V0
IGluIGFueSAuc2NjIGZpbGUgdGhhdCB3YW50cyB0byBzcGVjaWZ5IGJvdGggcGF0Y2hlcwphbmQg
Y29uZmlndXJhdGlvbi4KCklmIHNwZWNpZnlpbmcgdGhpcyBwZXItQlNQIGlzIG5vdCBkZXNpcmVk
LCBhIHNlY29uZGFyeSB2YXJpYWJsZSBpcwp1c2VkOgoKICBLTUVUQV9FWFRFUk5BTF9CU1BTCgpX
aGVuIHRoYXQgaXMgc2V0IGluIGEgYmJhcHBlbmQsIGFueSBsb2NhdGVkIEJTUCBkZWZpbml0aW9u
cyB3aWxsIGJlIHVzZWQKZm9yIGJvdGggcGF0Y2hlcyBhbmQgY29uZmlndXJhdGlvbi4KClNpZ25l
ZC1vZmYtYnk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+Ci0tLQog
bWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNzIHwgMTUgKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy9rZXJuZWwteW9jdG8uYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFz
cwppbmRleCA2NTM3Y2RmNDE2Li5lMzY3ZmUzZTI2IDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMv
a2VybmVsLXlvY3RvLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNs
YXNzCkBAIC0yMjAsNiArMjIwLDE0IEBAIGRvX2tlcm5lbF9tZXRhZGF0YSgpIHsKIAkJaWYgWyAk
PyAtbmUgMCBdOyB0aGVuCiAJCQliYmZhdGFsX2xvZyAiQ291bGQgbm90IGxvY2F0ZSBCU1AgZGVm
aW5pdGlvbiBmb3IgJHtLTUFDSElORX0vJHtMSU5VWF9LRVJORUxfVFlQRX0gYW5kIG5vIGRlZmNv
bmZpZyB3YXMgcHJvdmlkZWQiCiAJCWZpCisKKwkJIyBpZiB0aGUgYnNwIGRlZmluaXRpb24gaGFz
ICJkZWZpbmUgS01FVEFfRVhURVJOQUxfQlNQIHQiLAorCQkjIHRoZW4gd2UgbmVlZCB0byBzZXQg
YSBmbGFnIHRoYXQgd2lsbCBpbnN0cnVjdCB0aGUgbmV4dAorCQkjIHN0ZXBzIHRvIHVzZSB0aGUg
QlNQIGFzIGJvdGggY29uZmlndXJhdGlvbiBhbmQgcGF0Y2hlcy4KKwkJZ3JlcCAtcSBLTUVUQV9F
WFRFUk5BTF9CU1AgJGJzcF9kZWZpbml0aW9uCisJCWlmIFsgJD8gLWVxIDAgXTsgdGhlbgorCQkg
ICAgS01FVEFfRVhURVJOQUxfQlNQUz0idCIKKwkJZmkKIAlmaQogCW1ldGFfZGlyPSQoa2dpdCAt
LW1ldGEpCiAKQEAgLTIzMyw2ICsyNDEsMTMgQEAgZG9fa2VybmVsX21ldGFkYXRhKCkgewogCQlm
aQogCWZpCiAKKwkjIGlmIEtNRVRBX0VYVEVSTkFMX0JTUFMgaGFzIGJlZW4gc2V0LCBvciBpdCBo
YXMgYmVlbiBkZXRlY3RlZCBmcm9tCisJIyB0aGUgYnNwIGRlZmluaXRpb24sIHRoZW4gd2UgaW5q
ZWN0IHRoZSBic3BfZGVmaW5pdGlvbiBpbnRvIHRoZQorCSMgcGF0Y2ggcGhhc2UgYmVsb3cuICB3
ZSdsbCBwaWdneSBiYWNrIG9uIHRoZSBzY2NzIHZhcmlhYmxlLgorCWlmIFsgLW4gIiR7S01FVEFf
RVhURVJOQUxfQlNQU30iIF07IHRoZW4KKwkJc2NjcyA9ICIke2JzcF9kZWZpbml0aW9ufSAke3Nj
Y3N9IgorCWZpCisKIAkjIHJ1bjI6IG9ubHkgZ2VuZXJhdGUgcGF0Y2hlcyBmb3IgZWxlbWVudHMg
dGhhdCBoYXZlIGJlZW4gcGFzc2VkIG9uIHRoZSBTUkNfVVJJCiAJZWxlbWVudHM9ImBlY2hvIC1u
ICR7c2Njc30gJHtwYXRjaGVzfSAke0tFUk5FTF9GRUFUVVJFU31gIgogCWlmIFsgLW4gIiR7ZWxl
bWVudHN9IiBdOyB0aGVuCi0tIAoyLjE5LjEKCg==

--000000000000404de7059a15e406--
