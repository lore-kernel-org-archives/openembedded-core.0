Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1EDCCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 11:01:45 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.12966.1759921300963570090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 04:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOwOgnuh;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b50206773adso154455666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759921299; x=1760526099; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRRPcfB+EQl1OeUHktMbTB5uLte09f7Rf0C7NoiroP0=;
        b=AOwOgnuhoywq6UbmeLWXwDVeTXj0umYzHaI7HbJnVJdYidaeqo6F0plw8j2ZmF/5zh
         ibAzzEK7B8UponjPVambLBTskrJ9seTi/GQwOHZCSa4JLuP5CfG654SEPYQsH97fjMxm
         Lc5fvRiVKAN2MnyzVBM8l8kaiJCanU565hA4QfKzMecv5Rv/46ZYz5LlGYy+AEmpWxvn
         nyFLxALm8zvWvRLklDckfLWwxn0bKEwOTqPDX6ViIkxLC4gNsbezQnspW/jL03ro2dnB
         uezTXmTsCj+Z5PxEy6Ys0hql5UTn3gKKLPbGYxd1wC/9wNyhUqbhOXYGkDnaPBlW1ONa
         C4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759921299; x=1760526099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRRPcfB+EQl1OeUHktMbTB5uLte09f7Rf0C7NoiroP0=;
        b=VYQK0mdlc0f5kP9edGgx+YAMqzvMWnLZRNjAatDJMcmCwjQMuh5b2QjuYq37uenlWj
         CUZd1qD8qXqmKR2EHY/AeuB3zSDEKnQ5Omh+pe9fvNUqHFnyZ9pQEpcqlusFhkcm6y5e
         PidvXNpK+t8VqojEyuKZkk6A2rpOhFpvYq2+ypYpaigt8O8TbUngU9Hof2tGhFU6ZCph
         kfszNu3yRf+sdumf+uSFQ0hVpLWIInViT1W8VteP0ZNvPralOEorrAul4AL6CcC8Ssf+
         d7BFuz9UQZ+I2GLuuHafImzrpzU4MlTowQs4LvBPCw8/ByWsEyhOW5/06+C6qIHlcUlr
         zy4g==
X-Forwarded-Encrypted: i=1; AJvYcCWXQFJD9ZKq841qOQrVyByuPqOKwwfermkjWN32CR5SK2hOTS6brtoAfX7HUeyABOMQ7o4BE/88KmUlwQ2TSDNIRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw90JrR63W5ZbxdHEoSVdSbdbBOogHtvF5PuVFyiv3bICn0+9sh
	gh4fNY7J+oLmigS2nbGLO0dSdStEZkI1mtCW16AahwlqbI+ZuwEW8Rwf
X-Gm-Gg: ASbGncsOwr6/PdWc83osC4JCMzBXiJ2wVaGEITMRZHiAeXA7NPbNBkERU7ukfki9iQV
	vuAEnFfCy9QGS10dfO35IbRwtCwKKj39/INicXf5Vpaf3Z3FFEReDLYLUpqDEyrFYVe4amvgXQT
	kjSzyHWdYL6zz+VMpTGQYoapJMRh7edNx4d2goRfDH8NvtbfUVpCIiN+SaTwHMHYv4WAg0bOm8h
	Ht07bEMa6lH5CdyIU/vJ8ipaDQNxiew4anzyVZPdQvgiKccWQ4KYIrD4KJFJ1Bnc0hLq+m611B1
	2pX+BEHX6XErHMfjX8F13l3hR/OAaFEnMWiVtPhWnjvymU4Py5m/qoBnSVhYQ6YT3Dvq6rlj5C1
	PHQz3nNIXTlHAjhUOXVnQyBE2RY8RTFOi0ldzKLJeOvXhanwjmmNdDEg=
X-Google-Smtp-Source: AGHT+IHpAEZPKiRRYsBrXRhdcGnHffmTacTYkMvTGhtPHt0oDBdnzijhuNszc/bNVsxzkl/kKl/mTw==
X-Received: by 2002:a17:906:c143:b0:b40:bdc3:ca04 with SMTP id a640c23a62f3a-b50baba84camr381006066b.0.1759921296932;
        Wed, 08 Oct 2025 04:01:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4c34dsm1610186966b.80.2025.10.08.04.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:01:36 -0700 (PDT)
Message-ID: <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
Date: Wed, 8 Oct 2025 13:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 11:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224577

On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>> either a crate name that can be fetched from some registry (like crates.io), or
>> as a source crate, which is most often fetched from a git repository.
>>
>> Normally cargo handles fetching the crates from both the registry and from git,
>> however with Yocto this task is taken over by Bitbake.
>>
>> After fetching these crates, they are made available to cargo by adding the location
>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>> that can be found in the SRC_URI is added as one source crate.
>>
>> This works most of the time, as long as the repository really contains one crate only.
>>
>> However in case the repository is a cargo workspace, it contains multiple crates in
>> different subfolders, and in order to allow cargo to process them, they need to be
>> listed separately. This is not happening with the current implementation of cargo_common.
>>
>> This change introduces the following:
>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>    this was that maturin seems to ignore source crate patches from config.toml)
>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>    deleted git repository lines from it)
>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>    the separate crate folders are copied into this folder, and it is used as the central
>>    vendoring folder. This is needed for source replacements: the folder that is used for
>>    vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>    has the name of the crate that it contains. Workspaces are not included here (unless the
>>    given manifest is a workspace AND a package at once)
>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>    to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>    Having destsuffix is still mandatory though.
>>
>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
> I use a similar approach for my Cargo.lock fetcher. In my case the code 
> finds the crate on the fly inside the a git repository because the 
> Cargo.lock doesn't contain the subpath.

By any chance, did you manage to solve the workspace problem? If you
have a working solution, feel free to submit it, I wouldn't mind if I
wouldn't have to debug mine :D

>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>>
>> ---
>>   meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>   1 file changed, 108 insertions(+), 50 deletions(-)
>>
>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>> index c9eb2d09a5..79c1351298 100644
>> --- a/meta/classes-recipe/cargo_common.bbclass
>> +++ b/meta/classes-recipe/cargo_common.bbclass
>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>   python cargo_common_do_patch_paths() {
>>       import shutil
>>   
>> +    def is_rust_crate_folder(path):
>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>> +        return os.path.exists(cargo_toml_path)
>> +
>> +    def load_toml_file(toml_path):
>> +        import tomllib
>> +        with open(toml_path, 'rb') as f:
>> +            toml = tomllib.load(f)
>> +        return toml
>> +
>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>> +        for lf_repo in lockfile_repos.keys():
>> +            if repo in lf_repo and lf_repo.endswith(revision):
> Does this works if the URL contains a "rev" query parameter? This 
> happens if the same git repository is used with different revisions.

I *think* yes, since I query the revision from the fetcher, instead of
parsing it myself (and I use both the repo and revision for matching the
cargo.lock repos). But will test it specifically, and make it work if it
wouldn't work out of the box. Thanks for calling my attention on this.

>
>> +                lockfile_repos[lf_repo] = True
>> +                return lf_repo.split("#")[0]
>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>> +
>> +    def create_cargo_checksum(folder_path):
>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>> +        if os.path.exists(checksum_path):
>> +            return
>> +
>> +        import hashlib, json
>> +
>> +        checksum = {'files': {}}
>> +        for root, _, files in os.walk(folder_path):
>> +            for f in files:
>> +                full_path = os.path.join(root, f)
>> +                relative_path = os.path.relpath(full_path, folder_path)
>> +                if relative_path.startswith(".git/"):
>> +                    continue
>> +                with open(full_path, 'rb') as f2:
>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>> +                checksum["files"][relative_path] = file_sha
> Do we really need the calculation of the checksum?

For source replacement AFAIK it is mandatory, otherwise cargo complains.
(But I'd be happy to stand corrected)

>> +
>> +        with open(checksum_path, 'w') as f:
>> +            json.dump(checksum, f)
>> +
>>       cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>       if not os.path.exists(cargo_config):
>>           return
>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>       if len(src_uri) == 0:
>>           return
>>   
>> -    patches = dict()
>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>> +    if not os.path.exists(lockfile):
>> +        bb.fatal(f"{lockfile} file doesn't exist")
>> +
>> +    lockfile = load_toml_file(lockfile)
>> +
>> +    # key is the repo url, value is a boolean, which is used later
>> +    # to indicate if there is a matching repository in SRC_URI also
>> +    lockfile_git_repos = {}
>> +    for p in lockfile['package']:
>> +        if 'source' in p and p['source'].startswith('git+'):
>> +            lockfile_git_repos[p['source']] = False
>> +
>> +    sources = dict()
>>       workdir = d.getVar('UNPACKDIR')
>>       fetcher = bb.fetch2.Fetch(src_uri, d)
>> +
>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>> +
>> +    os.makedirs(vendor_folder)
>> +
>>       for url in fetcher.urls:
>>           ud = fetcher.ud[url]
>> -        if ud.type == 'git' or ud.type == 'gitsm':
>> -            name = ud.parm.get('name')
>> -            destsuffix = ud.parm.get('destsuffix')
>> -            if name is not None and destsuffix is not None:
>> -                if ud.user:
>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>> -                else:
>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>> -                patches.setdefault(repo, []).append(path)
>> +        if ud.type != 'git' and ud.type != 'gitsm':
>> +            continue
>>   
>> -    with open(cargo_config, "a+") as config:
>> -        for k, v in patches.items():
>> -            print('\n[patch."%s"]' % k, file=config)
>> -            for name in v:
>> -                print(name, file=config)
>> +        destsuffix = ud.parm.get('destsuffix')
>> +        crate_folder = os.path.join(workdir, destsuffix)
>>   
>> -    if not patches:
>> -        return
>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>> +            continue
>>   
>> -    # Cargo.lock file is needed for to be sure that artifacts
>> -    # downloaded by the fetch steps are those expected by the
>> -    # project and that the possible patches are correctly applied.
>> -    # Moreover since we do not want any modification
>> -    # of this file (for reproducibility purpose), we prevent it by
>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>> -    # here is better than letting cargo tell (in case the file is missing)
>> -    # "Cargo.lock should be modified but --frozen was given"
>> +        if ud.user:
>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>> +        else:
>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>   
>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>> -    if not os.path.exists(lockfile):
>> -        bb.fatal(f"{lockfile} file doesn't exist")
>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>> +
>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>> +        cargo_toml = load_toml_file(cargo_toml_path)
>> +
>> +        if 'workspace' in cargo_toml:
>> +            members = cargo_toml['workspace']['members']
>> +            for member in members:
>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>> +                member_crate_name = member_cargo_toml['package']['name']
>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>> +
>> +        if 'package' in cargo_toml:
>> +            crate_folder = os.path.join(workdir, destsuffix)
>> +            crate_name = cargo_toml['package']['name']
>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>> +
>> +    for d in os.scandir(vendor_folder):
>> +        if d.is_dir():
>> +            create_cargo_checksum(d.path)
>> +
>> +
>> +    with open(cargo_config, "a+") as config:
>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>> +        print('directory = "%s"' % vendor_folder, file=config)
>> +
>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>> +            print('git = "%s"' % repo, file=config)
>> +            print('rev = "%s"' % revision, file=config)
>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>> +
>> +    # check if there are any git repos in the lock file that were not visited
>> +    # in the previous loop, when the source replacement was created, and warn about it
>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>> +        if not found_in_src_uri:
>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>   
>> -    # There are patched files and so Cargo.lock should be modified but we use
>> -    # --frozen so let's handle that modifications here.
>> -    #
>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>> -    # patched packages:
>> -    #  cargo update --offline -p package_1 -p package_2
>> -    # But this is not possible since it requires that cargo local git db
>> -    # to be populated and this is not the case as we fetch git repo ourself.
>> -
>> -    lockfile_orig = lockfile + ".orig"
>> -    if not os.path.exists(lockfile_orig):
>> -        shutil.copy(lockfile, lockfile_orig)
>> -
>> -    newlines = []
>> -    with open(lockfile_orig, "r") as f:
>> -        for line in f.readlines():
>> -            if not line.startswith("source = \"git"):
>> -                newlines.append(line)
>> -
>> -    with open(lockfile, "w") as f:
>> -        f.writelines(newlines)
>>   }
>> +
>>   do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>   
>>   do_compile:prepend () {
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224426): https://lists.openembedded.org/g/openembedded-core/message/224426
>> Mute This Topic: https://lists.openembedded.org/mt/115578466/6374899
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


