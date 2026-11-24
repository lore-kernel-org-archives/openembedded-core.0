Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31356.1795561982671768350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 15:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0Nu+O7PA;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso5139790d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 15:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795561982; cv=none;
        d=google.com; s=arc-20260327;
        b=J5kSA8MK9w0p66sG6KMxtgDV4GUM6UBrD1nqtf6c6EWtZ1cgcbImZHcPce1548wQLT
         SnIa3mbv4NdY3ex5cRqpZ6OuuqRUqSrJ+FceG7Ta7aFhilo2ldyZxl4gYhN2bt5ih2VS
         uqiIWT8ScTT1OdPljtoNQ9+NA2EuXzhO74UlWR9r17ZJVRUKUDZpWS5LhTSu1InSMf4k
         QaH+0SDzYqeoPfQhzuEqrgTiFEgp0L82JlkqXLpJ5Hgi9jXkjuQMg90qjxBCaBv9MfW1
         8vvMec/VsUilePlCvq/Nt/r0gO5E9gxaeHPkMfhOLVXIhO2ZTtmqBkXaADNcFdpCoWiT
         ujow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QrVqkauuEkybf0luuPZgBNvP0VBJQrzRBsHUjlpGmAo=;
        fh=x4HEGiz3Le+5Lc7a1sPba9pC5kJ18gzkJHpnhl1cn9Y=;
        b=bzV9iOpLtxbrvXOSI/HlucUH7gNMCYWSVGwO6UQbP4SAjh28xchlbWrgjtuJ4Dg9qP
         r9PrXeCeogb0eo5U+jG/rMuiF7glfR89q3P/xQbWNR5ZnbZHAVRlogzkSd4eWp7d9Zhn
         9bBiI4WgOvc7mzmJRc2+4rWOUv8EBe0Hb+28NVHZNHhKq2tcG8GenSHSe7aURhFSq6gP
         +wkGfKlGGqXplU8gUc4pGEpv6SRhkCf/cQLUAwPRhs/AfTi4wIoA/y+2QKxf7Vkby5/8
         UelwoqTsGMVlMEmMMuBMuw0p3o5SlqD9tcGT3wZZbtFhj8CAc8Smld2qgUrmCUT0+aF+
         YkSQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561982; x=1796166782; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrVqkauuEkybf0luuPZgBNvP0VBJQrzRBsHUjlpGmAo=;
        b=0Nu+O7PAgkUrKZ7UqAK6XZp4Vu7kCIVJmavGAZpZ2s7UGj3DGYMceiU7KgasR6HRlS
         tblKk8rKw/7+OtSYtz89oWsT4nESJFxEho/l7EGD4LAl1VmHtOl8Cb/oNROokxPI0NDc
         CeSNEkYzypP4MLlzP77PcavgpOJEiENsKSiB31ZRoZLM8ONQIjHbO10dg3Vlo516tpRl
         Hf+mqvvZiTKBFezGKmDnqmUXCfkikAtXcMj8AQuysod4TqDpnBBFNke0dmLppLZ1l/9x
         dl5Q/M7PLn802BH2BF/RPXA+qrLdCiqSvq46M1IWqCr1LVxAjhzHqR9TXQUEewjpa5N7
         JiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561982; x=1796166782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QrVqkauuEkybf0luuPZgBNvP0VBJQrzRBsHUjlpGmAo=;
        b=xNZxp20adclMphd3GJhxeg7qH3erJzEe9gGQq6Dft8XbTpd5qghnPlmjJPLjsIVVug
         ypeHiM986TmTGb1qknlStTu7DTmqZO4TMsk6xE1SxwH/MceVWpmF3Co49LbA6eqmGc/G
         AvGtdSG82kJAlAK8ocS02kzwnr9OtdkoG1XsCTa2TT0bMaC4BES0aEtXvXV5cwMCo2F2
         QfdcLrgAKX6jfPDu1tpRIkkFdSd21ZiJBzzxNYkZ6EyfxCVKngtdyukO1295TPtptLxZ
         G/2Ten0rnKAP10+YJfPkfc+UuErbqUnKMN5hFb1FLHax3p0L14wEtIwXo7HRNjAJYE9D
         kvxw==
X-Gm-Message-State: APuU4Z+7q6xXQhtKQRBYzOnvtHOnWokENBGRsRwOsOL25WCyJ4ApekaJ
	PqF6CSVwRsRhL/Wtjbs0gxTpe2yFR/R+Cj7QjAujVOwo4XQk7v/3BKsnmDTDlYSUw1EjlYicrx8
	H8A0uT9NV6UAB6n+Jlckdv0Rwv3hZdv0=
X-Gm-Gg: AZFdTZdiQuFsN2sRDQMGnMx3cG7N6lg/NKc40KDn5D/W4u3MghCH6J5y0o0NMFRo7+r
	HgPJUm93pYUI2JnNe2LLMXUEzTHy9G9uZ4LGtvlmWe8KRMtzb3WCZqp/16ZiGOq0IU+CZ7XFhjO
	4+dZnPpBEsDGlos3L882U33o/B7wAeVi1QcwNOFrVjO80apEWrdNy7krfO0uowAq5Cu6r5JHbZN
	g9wktQPl+bgAimYHSPCu2xrdBa9W6AIVol3AVJOZO+6KA8eMqE5ei/cgObMqEiRReUdiZs8KTrv
	D13IWAdNo15eMihNVIunPg7Z/OJ29iUJPGxbA8eXKrD2alvdJWlP04vOmoaBuj/e8gxlwE+UHJd
	D+u/OL8s7j8HDKbdOxLtJWRNqdbRqIEeXzTHH0/GiCRLmZJTK30U=
X-Received: by 2002:a05:690e:bc5:b0:67d:c106:bb4d with SMTP id
 956f58d0204a3-67dec45e43emr6767607d50.25.1795561981657; Tue, 24 Nov 2026
 15:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20261119204909.2931233-1-stondo@gmail.com> <20261119204909.2931233-3-stondo@gmail.com>
In-Reply-To: <20261119204909.2931233-3-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 24 Nov 2026 16:12:50 -0700
X-Gm-Features: Aa3M54qonUWrg9NJMP5SHAZPgjvHVjLVxnma3KtWHyTfgXWImWmOdbdBG2EqdJE
Message-ID: <CAJdd5GaVPXT8Af3qNPWRArPLRMupC875nHSw_jdqBs_563hjkw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] spdx30: Record the lifecycle scope of crate dependencies
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, Paul Barker <paul@pbarker.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Peter Marko <peter.marko@siemens.com>, 
	stefano.tondo.ext@siemens.com
Content-Type: multipart/alternative; boundary="00000000000016c62b06610dda0b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 23:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251125

--00000000000016c62b06610dda0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:49=E2=80=AFPM Stefano Tondo <stondo@gmail.com> wr=
ote:

> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> A Cargo.lock file lists the crates for all targets, and some crates
> only run at build time (build scripts, proc-macros and the crates
> they use). The fetcher downloads all of them, but only some end up in
> the binary.
>
> Add a do_cargo_metadata task that writes the dependency graph for the
> target with cargo metadata --filter-platform. The create_spdx task
> reads this graph. It links the build to each crate download with a
> scoped dependsOn relationship: runtime, build or test. A crate that is
> not used on the target gets an annotation instead.
>
> The walk expands each workspace member only once. Members can depend
> on each other in a cycle, and a member can be a dev dependency of
> itself, as uv-preview is in python3-uv-build.
>
> Add unit tests for the scopes, with member cycles.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/classes-recipe/cargo.bbclass             | 17 ++++
>  meta/lib/oe/spdx30_tasks.py                   | 90 +++++++++++++++++++
>  .../oeqa/selftest/cases/oelib/cargo_scopes.py | 73 +++++++++++++++
>  3 files changed, 180 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
>
> diff --git a/meta/classes-recipe/cargo.bbclass
> b/meta/classes-recipe/cargo.bbclass
> index 586071988a..b3e82f9d5b 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -26,6 +26,23 @@ cargo_do_compile () {
>         "${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS}
> "$@"
>  }
>
> +# The crate dependency graph for the target, with the crates that are no=
t
> +# used on it removed. create-spdx uses it to give each crate download a
> +# lifecycle scope.
> +CARGO_METADATA_FILE =3D "${WORKDIR}/cargo-metadata.json"
> +
> +do_cargo_metadata () {
> +       rm -f "${CARGO_METADATA_FILE}"
> +       # Some recipes inherit cargo without being a cargo project
> +       if [ ! -f "${CARGO_MANIFEST_PATH}" ]; then
> +               return
> +       fi
> +       "${CARGO}" metadata --format-version 1 --offline --locked \
> +               --manifest-path "${CARGO_MANIFEST_PATH}" \
> +               --filter-platform "${RUST_HOST_SYS}" >
> "${CARGO_METADATA_FILE}"
> +}
> +addtask cargo_metadata after do_configure before do_compile do_create_sp=
dx
> +
>  cargo_do_install () {
>         local have_installed=3Dfalse
>         for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index eded315819..01e4eefa2d 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -476,6 +476,94 @@ def set_package_identity(d, dl, fd):
>          dl.software_packageUrl =3D identity.purl
>
>
> +def get_cargo_scopes(d):
> +    """Return {(crate, version): scope} from CARGO_METADATA_FILE.
> +
> +    The file is the output of cargo metadata --filter-platform for the
> +    target, so crates used only on other targets are absent. Walks the
> +    dependency graph from the workspace members: normal dependencies are
> +    runtime, build dependencies and proc-macro crates (and everything th=
ey
> +    pull in) are build, dev dependencies of the members are test.
> +    """
> +    path =3D d.getVar("CARGO_METADATA_FILE")
> +    if not path or not os.path.exists(path):
> +        return None
> +
> +    with open(path) as f:
> +        metadata =3D json.load(f)
> +
> +    packages =3D {p["id"]: p for p in metadata["packages"]}
> +    nodes =3D {n["id"]: n for n in metadata["resolve"]["nodes"]}
> +    members =3D set(metadata["workspace_members"])
> +    rank =3D {"test": 1, "build": 2, "runtime": 3}
> +
> +    def is_proc_macro(pkg_id):
> +        return any("proc-macro" in t["kind"] for t in
> packages[pkg_id]["targets"])
> +
> +    scopes =3D {}
> +    expanded_members =3D set()
> +    stack =3D [(m, "runtime") for m in members]
> +    while stack:
> +        pkg_id, scope =3D stack.pop()
> +        if pkg_id in members:
> +            # A member is a root with the runtime scope. Expand it only
> +            # once: members can depend on each other in a cycle, and a
> +            # member can even be a dev dependency of itself.
> +            if pkg_id in expanded_members:
> +                continue
> +            expanded_members.add(pkg_id)
> +            scope =3D "runtime"
> +        else:
> +            if scope =3D=3D "runtime" and is_proc_macro(pkg_id):
> +                scope =3D "build"
> +            if rank.get(scopes.get(pkg_id), 0) >=3D rank[scope]:
> +                continue
> +            scopes[pkg_id] =3D scope
> +        for dep in nodes[pkg_id]["deps"]:
> +            for kind in (k["kind"] for k in dep["dep_kinds"]):
> +                if kind =3D=3D "dev":
> +                    if pkg_id in members:
> +                        stack.append((dep["pkg"], "test"))
> +                elif kind =3D=3D "build":
> +                    stack.append((dep["pkg"], "test" if scope =3D=3D "te=
st"
> else "build"))
> +                else:
> +                    stack.append((dep["pkg"], scope))
> +
> +    return {
> +        (packages[i]["name"], packages[i]["version"]): s for i, s in
> scopes.items()
> +    }
> +
> +
> +def add_dependency_scopes(d, objset, build, source_files):
> +    """Give crate downloads a lifecycle scope, see get_cargo_scopes().""=
"
> +    scopes =3D get_cargo_scopes(d)
> +    if scopes is None:
> +        return
> +
> +    by_scope =3D {}
> +    for dl in source_files:
> +        if not (getattr(dl, "software_packageUrl", None) or
> "").startswith("pkg:cargo/"):
>

I'd really like to see a way that this could be done that is not so cargo
specific; is it possible for the bbclass to provide a scope function name
that gets called by the SPDX code to determine the scopes? This would allow
other classes to implement their own dependency scope function and also
keep the specific parsing code out of the SPDX code files.


> +            continue
> +        scope =3D scopes.get((dl.name, dl.software_packageVersion))
> +        if scope:
> +            by_scope.setdefault(scope, []).append(dl)
> +        else:
> +            objset.new_annotation(
> +                dl,
> +                "%s %s is fetched but not built: not used on target %s"
> +                % (dl.name, dl.software_packageVersion,
> d.getVar("RUST_HOST_SYS")),
> +                oe.spdx30.AnnotationType.other,
> +            )
> +
> +    for scope, dls in sorted(by_scope.items()):
> +        objset.new_scoped_relationship(
> +            [build],
> +            oe.spdx30.RelationshipType.dependsOn,
> +            getattr(oe.spdx30.LifecycleScopeType, scope),
> +            sorted(oe.sbom30.get_element_link_id(dl) for dl in dls),
> +        )
> +
> +
>  def add_download_files(d, objset):
>      inputs =3D set()
>      release_date =3D get_release_date(d)
> @@ -978,6 +1066,8 @@ def create_spdx(d):
>
>      source_files =3D add_download_files(d, build_objset)
>      build_inputs |=3D source_files
> +    if bb.data.inherits_class("cargo", d):
> +        add_dependency_scopes(d, build_objset, build, source_files)
>
>      recipe_spdx_license =3D add_license_expression(
>          d, build_objset, d.getVar("LICENSE"), license_data,
> [recipe_objset]
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
> b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
> new file mode 100644
> index 0000000000..6273346668
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py
> @@ -0,0 +1,73 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import json
> +import os
> +import tempfile
> +from unittest.case import TestCase
> +
> +import bb.data
> +import oe.spdx30_tasks
> +
> +
> +def package(name, proc_macro=3DFalse):
> +    kind =3D ["proc-macro"] if proc_macro else ["lib"]
> +    return {"id": name, "name": name, "version": "1.0.0", "targets":
> [{"kind": kind}]}
> +
> +
> +def dep(name, *kinds):
> +    return {"pkg": name, "dep_kinds": [{"kind": kind} for kind in kinds
> or (None,)]}
> +
> +
> +class TestCargoScopes(TestCase):
> +    def get_scopes(self, members, packages, deps):
> +        metadata =3D {
> +            "packages": packages,
> +            "workspace_members": members,
> +            "resolve": {"nodes": [{"id": p["id"], "deps":
> deps.get(p["id"], [])} for p in packages]},
> +        }
> +        with tempfile.TemporaryDirectory() as tmpdir:
> +            path =3D os.path.join(tmpdir, "cargo-metadata.json")
> +            with open(path, "w") as f:
> +                json.dump(metadata, f)
> +            d =3D bb.data.init()
> +            d.setVar("CARGO_METADATA_FILE", path)
> +            scopes =3D oe.spdx30_tasks.get_cargo_scopes(d)
> +        return {name: scope for (name, version), scope in scopes.items()=
}
> +
> +    def test_scopes(self):
> +        packages =3D [package(n) for n in ("app", "runtime-dep",
> "build-dep", "build-dep-dep",
> +                                         "dev-dep", "shared")]
> +        packages.append(package("derive", proc_macro=3DTrue))
> +        deps =3D {
> +            "app": [dep("runtime-dep"), dep("build-dep", "build"),
> dep("dev-dep", "dev"),
> +                    dep("derive"), dep("shared", "dev")],
> +            "build-dep": [dep("build-dep-dep")],
> +            "runtime-dep": [dep("shared")],
> +        }
> +        self.assertEqual(self.get_scopes(["app"], packages, deps), {
> +            "runtime-dep": "runtime",
> +            "shared": "runtime",
> +            "build-dep": "build",
> +            "build-dep-dep": "build",
> +            "derive": "build",
> +            "dev-dep": "test",
> +        })
> +
> +    def test_member_cycles(self):
> +        # Workspace members that depend on each other in a cycle, and a
> member
> +        # that is a dev dependency of itself, as in uv. Each member is a
> root
> +        # and is expanded once.
> +        packages =3D [package(n) for n in ("member-a", "member-b",
> "member-c", "crate-a", "crate-c")]
> +        deps =3D {
> +            "member-a": [dep("member-b"), dep("member-a", "dev"),
> dep("crate-a")],
> +            "member-b": [dep("member-c"), dep("member-a", "dev")],
> +            "member-c": [dep("member-a"), dep("member-c", None, "dev"),
> dep("crate-c", "dev")],
> +        }
> +        self.assertEqual(self.get_scopes(["member-a", "member-b",
> "member-c"], packages, deps), {
> +            "crate-a": "runtime",
> +            "crate-c": "test",
> +        })
> --
> 2.56.1
>
>

--00000000000016c62b06610dda0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 19,=
 2026 at 1:49=E2=80=AFPM Stefano Tondo &lt;<a href=3D"mailto:stondo@gmail.c=
om">stondo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo=
.ext@siemens.com" target=3D"_blank">stefano.tondo.ext@siemens.com</a>&gt;<b=
r>
<br>
A Cargo.lock file lists the crates for all targets, and some crates<br>
only run at build time (build scripts, proc-macros and the crates<br>
they use). The fetcher downloads all of them, but only some end up in<br>
the binary.<br>
<br>
Add a do_cargo_metadata task that writes the dependency graph for the<br>
target with cargo metadata --filter-platform. The create_spdx task<br>
reads this graph. It links the build to each crate download with a<br>
scoped dependsOn relationship: runtime, build or test. A crate that is<br>
not used on the target gets an annotation instead.<br>
<br>
The walk expands each workspace member only once. Members can depend<br>
on each other in a cycle, and a member can be a dev dependency of<br>
itself, as uv-preview is in python3-uv-build.<br>
<br>
Add unit tests for the scopes, with member cycles.<br>
<br>
Signed-off-by: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemen=
s.com" target=3D"_blank">stefano.tondo.ext@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cargo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 17 ++++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 90 +++++++++++++++++++<br>
=C2=A0.../oeqa/selftest/cases/oelib/cargo_scopes.py | 73 +++++++++++++++<br=
>
=C2=A03 files changed, 180 insertions(+)<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py=
<br>
<br>
diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.=
bbclass<br>
index 586071988a..b3e82f9d5b 100644<br>
--- a/meta/classes-recipe/cargo.bbclass<br>
+++ b/meta/classes-recipe/cargo.bbclass<br>
@@ -26,6 +26,23 @@ cargo_do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${CARGO}&quot; build ${CARGO_BUILD_FLAGS}=
 ${PACKAGECONFIG_CONFARGS} &quot;$@&quot;<br>
=C2=A0}<br>
<br>
+# The crate dependency graph for the target, with the crates that are not<=
br>
+# used on it removed. create-spdx uses it to give each crate download a<br=
>
+# lifecycle scope.<br>
+CARGO_METADATA_FILE =3D &quot;${WORKDIR}/cargo-metadata.json&quot;<br>
+<br>
+do_cargo_metadata () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f &quot;${CARGO_METADATA_FILE}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Some recipes inherit cargo without being a ca=
rgo project<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f &quot;${CARGO_MANIFEST_PATH}&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${CARGO}&quot; metadata --format-version =
1 --offline --locked \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--manifest-path &qu=
ot;${CARGO_MANIFEST_PATH}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--filter-platform &=
quot;${RUST_HOST_SYS}&quot; &gt; &quot;${CARGO_METADATA_FILE}&quot;<br>
+}<br>
+addtask cargo_metadata after do_configure before do_compile do_create_spdx=
<br>
+<br>
=C2=A0cargo_do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local have_installed=3Dfalse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tgt in &quot;${B}/target/${CARGO_TARGET_SUB=
DIR}/&quot;*; do<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index eded315819..01e4eefa2d 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -476,6 +476,94 @@ def set_package_identity(d, dl, fd):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dl.software_packageUrl =3D identity.purl<=
br>
<br>
<br>
+def get_cargo_scopes(d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Return {(crate, version): scope} from CARG=
O_METADATA_FILE.<br>
+<br>
+=C2=A0 =C2=A0 The file is the output of cargo metadata --filter-platform f=
or the<br>
+=C2=A0 =C2=A0 target, so crates used only on other targets are absent. Wal=
ks the<br>
+=C2=A0 =C2=A0 dependency graph from the workspace members: normal dependen=
cies are<br>
+=C2=A0 =C2=A0 runtime, build dependencies and proc-macro crates (and every=
thing they<br>
+=C2=A0 =C2=A0 pull in) are build, dev dependencies of the members are test=
.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 path =3D d.getVar(&quot;CARGO_METADATA_FILE&quot;)<br>
+=C2=A0 =C2=A0 if not path or not os.path.exists(path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 with open(path) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 metadata =3D json.load(f)<br>
+<br>
+=C2=A0 =C2=A0 packages =3D {p[&quot;id&quot;]: p for p in metadata[&quot;p=
ackages&quot;]}<br>
+=C2=A0 =C2=A0 nodes =3D {n[&quot;id&quot;]: n for n in metadata[&quot;reso=
lve&quot;][&quot;nodes&quot;]}<br>
+=C2=A0 =C2=A0 members =3D set(metadata[&quot;workspace_members&quot;])<br>
+=C2=A0 =C2=A0 rank =3D {&quot;test&quot;: 1, &quot;build&quot;: 2, &quot;r=
untime&quot;: 3}<br>
+<br>
+=C2=A0 =C2=A0 def is_proc_macro(pkg_id):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return any(&quot;proc-macro&quot; in t[&quot;k=
ind&quot;] for t in packages[pkg_id][&quot;targets&quot;])<br>
+<br>
+=C2=A0 =C2=A0 scopes =3D {}<br>
+=C2=A0 =C2=A0 expanded_members =3D set()<br>
+=C2=A0 =C2=A0 stack =3D [(m, &quot;runtime&quot;) for m in members]<br>
+=C2=A0 =C2=A0 while stack:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_id, scope =3D stack.pop()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg_id in members:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # A member is a root with the ru=
ntime scope. Expand it only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # once: members can depend on ea=
ch other in a cycle, and a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # member can even be a dev depen=
dency of itself.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg_id in expanded_members:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expanded_members.add(pkg_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scope =3D &quot;runtime&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if scope =3D=3D &quot;runtime&qu=
ot; and is_proc_macro(pkg_id):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scope =3D &quot;bu=
ild&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if rank.get(scopes.get(pkg_id), =
0) &gt;=3D rank[scope]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scopes[pkg_id] =3D scope<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in nodes[pkg_id][&quot;deps&quot;]:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for kind in (k[&quot;kind&quot;]=
 for k in dep[&quot;dep_kinds&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if kind =3D=3D &qu=
ot;dev&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p=
kg_id in members:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 stack.append((dep[&quot;pkg&quot;], &quot;test&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif kind =3D=3D &=
quot;build&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stac=
k.append((dep[&quot;pkg&quot;], &quot;test&quot; if scope =3D=3D &quot;test=
&quot; else &quot;build&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stac=
k.append((dep[&quot;pkg&quot;], scope))<br>
+<br>
+=C2=A0 =C2=A0 return {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (packages[i][&quot;name&quot;], packages[i][&q=
uot;version&quot;]): s for i, s in scopes.items()<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+<br>
+def add_dependency_scopes(d, objset, build, source_files):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Give crate downloads a lifecycle scope, se=
e get_cargo_scopes().&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 scopes =3D get_cargo_scopes(d)<br>
+=C2=A0 =C2=A0 if scopes is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 by_scope =3D {}<br>
+=C2=A0 =C2=A0 for dl in source_files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (getattr(dl, &quot;software_packageUrl&=
quot;, None) or &quot;&quot;).startswith(&quot;pkg:cargo/&quot;):<br></bloc=
kquote><div><br></div><div>I&#39;d really like to see a way that this could=
 be done that is not so cargo specific; is it possible for the bbclass to p=
rovide a scope function name that gets called by the SPDX code to determine=
 the scopes? This would allow other classes to implement their own dependen=
cy scope function and also keep the specific parsing code out of the SPDX c=
ode files.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 scope =3D scopes.get((<a href=3D"http://dl.nam=
e" rel=3D"noreferrer" target=3D"_blank">dl.name</a>, dl.software_packageVer=
sion))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if scope:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 by_scope.setdefault(scope, []).a=
ppend(dl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objset.new_annotation(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s %s is fet=
ched but not built: not used on target %s&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (<a href=3D"http=
://dl.name" rel=3D"noreferrer" target=3D"_blank">dl.name</a>, dl.software_p=
ackageVersion, d.getVar(&quot;RUST_HOST_SYS&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.Annotati=
onType.other,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 for scope, dls in sorted(by_scope.items()):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 objset.new_scoped_relationship(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [build],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.RelationshipType.depen=
dsOn,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getattr(oe.spdx30.LifecycleScope=
Type, scope),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sorted(oe.sbom30.get_element_lin=
k_id(dl) for dl in dls),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+<br>
=C2=A0def add_download_files(d, objset):<br>
=C2=A0 =C2=A0 =C2=A0inputs =3D set()<br>
=C2=A0 =C2=A0 =C2=A0release_date =3D get_release_date(d)<br>
@@ -978,6 +1066,8 @@ def create_spdx(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0source_files =3D add_download_files(d, build_objset)<br=
>
=C2=A0 =C2=A0 =C2=A0build_inputs |=3D source_files<br>
+=C2=A0 =C2=A0 if bb.data.inherits_class(&quot;cargo&quot;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_dependency_scopes(d, build_objset, build, =
source_files)<br>
<br>
=C2=A0 =C2=A0 =C2=A0recipe_spdx_license =3D add_license_expression(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d, build_objset, d.getVar(&quot;LICENSE&q=
uot;), license_data, [recipe_objset]<br>
diff --git a/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py b/meta/lib/=
oeqa/selftest/cases/oelib/cargo_scopes.py<br>
new file mode 100644<br>
index 0000000000..6273346668<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/oelib/cargo_scopes.py<br>
@@ -0,0 +1,73 @@<br>
+#<br>
+# Copyright OpenEmbedded Contributors<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+import json<br>
+import os<br>
+import tempfile<br>
+from unittest.case import TestCase<br>
+<br>
+import bb.data<br>
+import oe.spdx30_tasks<br>
+<br>
+<br>
+def package(name, proc_macro=3DFalse):<br>
+=C2=A0 =C2=A0 kind =3D [&quot;proc-macro&quot;] if proc_macro else [&quot;=
lib&quot;]<br>
+=C2=A0 =C2=A0 return {&quot;id&quot;: name, &quot;name&quot;: name, &quot;=
version&quot;: &quot;1.0.0&quot;, &quot;targets&quot;: [{&quot;kind&quot;: =
kind}]}<br>
+<br>
+<br>
+def dep(name, *kinds):<br>
+=C2=A0 =C2=A0 return {&quot;pkg&quot;: name, &quot;dep_kinds&quot;: [{&quo=
t;kind&quot;: kind} for kind in kinds or (None,)]}<br>
+<br>
+<br>
+class TestCargoScopes(TestCase):<br>
+=C2=A0 =C2=A0 def get_scopes(self, members, packages, deps):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 metadata =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;packages&quot;: packages,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;workspace_members&quot;: m=
embers,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;resolve&quot;: {&quot;node=
s&quot;: [{&quot;id&quot;: p[&quot;id&quot;], &quot;deps&quot;: deps.get(p[=
&quot;id&quot;], [])} for p in packages]},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with tempfile.TemporaryDirectory() as tmpdir:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D os.path.join(tmpdir, &q=
uot;cargo-metadata.json&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(path, &quot;w&quot;) a=
s f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(metadata=
, f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d =3D bb.data.init()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;CARGO_METADATA_FI=
LE&quot;, path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scopes =3D oe.spdx30_tasks.get_c=
argo_scopes(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {name: scope for (name, version), scope=
 in scopes.items()}<br>
+<br>
+=C2=A0 =C2=A0 def test_scopes(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages =3D [package(n) for n in (&quot;app&q=
uot;, &quot;runtime-dep&quot;, &quot;build-dep&quot;, &quot;build-dep-dep&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;dev-dep&quot;, &quot;shared&quot;)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages.append(package(&quot;derive&quot;, pr=
oc_macro=3DTrue))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;app&quot;: [dep(&quot;runt=
ime-dep&quot;), dep(&quot;build-dep&quot;, &quot;build&quot;), dep(&quot;de=
v-dep&quot;, &quot;dev&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep(=
&quot;derive&quot;), dep(&quot;shared&quot;, &quot;dev&quot;)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;build-dep&quot;: [dep(&quo=
t;build-dep-dep&quot;)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;runtime-dep&quot;: [dep(&q=
uot;shared&quot;)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.get_scopes([&quot;app&qu=
ot;], packages, deps), {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;runtime-dep&quot;: &quot;r=
untime&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;shared&quot;: &quot;runtim=
e&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;build-dep&quot;: &quot;bui=
ld&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;build-dep-dep&quot;: &quot=
;build&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;derive&quot;: &quot;build&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dev-dep&quot;: &quot;test&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
+<br>
+=C2=A0 =C2=A0 def test_member_cycles(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Workspace members that depend on each other =
in a cycle, and a member<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that is a dev dependency of itself, as in uv=
. Each member is a root<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and is expanded once.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages =3D [package(n) for n in (&quot;membe=
r-a&quot;, &quot;member-b&quot;, &quot;member-c&quot;, &quot;crate-a&quot;,=
 &quot;crate-c&quot;)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;member-a&quot;: [dep(&quot=
;member-b&quot;), dep(&quot;member-a&quot;, &quot;dev&quot;), dep(&quot;cra=
te-a&quot;)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;member-b&quot;: [dep(&quot=
;member-c&quot;), dep(&quot;member-a&quot;, &quot;dev&quot;)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;member-c&quot;: [dep(&quot=
;member-a&quot;), dep(&quot;member-c&quot;, None, &quot;dev&quot;), dep(&qu=
ot;crate-c&quot;, &quot;dev&quot;)],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(self.get_scopes([&quot;member=
-a&quot;, &quot;member-b&quot;, &quot;member-c&quot;], packages, deps), {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crate-a&quot;: &quot;runti=
me&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;crate-c&quot;: &quot;test&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
-- <br>
2.56.1<br>
<br>
</blockquote></div></div>

--00000000000016c62b06610dda0b--
