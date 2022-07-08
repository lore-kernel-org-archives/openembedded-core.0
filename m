Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F27EC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 19:33:41 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.3341.1657308814990921158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R8COkeCl;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id t19so37274266lfl.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tcSIfezOlhl1hXCl3l2xVePmUjNRiJGk2RDyxGv583k=;
        b=R8COkeClQIiLM3jc2YsYjDBUUpC+h2mURjr2RzGH717UL7SGkKBWKI1H1/z3iIiT1b
         4Y0iQSFuug1i0ryhDSCJaAjQ8Djoa6zAvEZz21dVRVfco7wADeEXF9wR9K7Svhp42zBA
         1VbwT21dOQYOt819s+16wdEKaN3406JuAhQZ2JUu/Ym/f5ZoFZgt2Wvy9a7YbWE0VJEe
         Ev213CbODryRn/6ZC4MF2gr/kNmFlxVTfChbWR1GIir+OJfT/FNVZ+xJXibJHUEU2bNq
         dww4hS0PbTnFb4mNXpcHs95GAntBSjjfv4p/KSlPk4YsOBE/Oxu/CS0xzCN8f/dcuaMl
         Xoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tcSIfezOlhl1hXCl3l2xVePmUjNRiJGk2RDyxGv583k=;
        b=T4DRBGBccq2HcOXQGb5t4tBUoQzlJHP3eYghFvw2b4OWqe0tZNzRS888/BuP0KXbFy
         UHibGtVqtKMYviDtRUhB4xkxjjePGv3zOXK89wZeRGE9tanVilF9o4uij6t2r01fjtX0
         cJWhcrxjGJkBuxMxpNuDpCm15CEahiW9T6jBLFxTez/X9pmXa4V3o1/WfFRDNkCa8WHa
         bAjCoQPaeQpmG22xbcx9VHgG813maVq4OksTheEGFD0rxc5665wAFCaWidZYdz5tLfGG
         3KQfQHiX86nYsnUZ99g+72pJ6/3syAG7OqD0nA83mAQL+8dY9Law4MhmLJghHwQLg8dW
         1N+w==
X-Gm-Message-State: AJIora9nS2iE1uVYAx8Ew+VW+SnkCUQ+bPCG93QF5dBOJ7Vhyu7XiysW
	xtJnRw3NCd0DwxVt2Eb1K02+VRT5LoLOa7LwcJ4=
X-Google-Smtp-Source: 
 AGRyM1tpxdIa6zM+kEdZ1itdBrWqioPkM+TFSb0BO5t0jVmsL7FHYXJyhpDUBFpTuRQ4rBqNrLKuxyBsspqykaT/yTA=
X-Received: by 2002:ac2:4bcf:0:b0:481:16ae:5a56 with SMTP id
 o15-20020ac24bcf000000b0048116ae5a56mr3552901lfq.642.1657308813091; Fri, 08
 Jul 2022 12:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220708191730.3413011-1-alex@linutronix.de>
In-Reply-To: <20220708191730.3413011-1-alex@linutronix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 8 Jul 2022 14:33:21 -0500
Message-ID: 
 <CAJdd5Gbs6YKYs3qNgt_jQriiR7ix8XtPubMAmc2ftK5CMuNNfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] meta/files: add layer setup JSON schema and
 example
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 19:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167832

On Fri, Jul 8, 2022 at 2:17 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> From: Joshua Watt <JPEWhacker@gmail.com>
>
> Defines a common schema for layer setup that can be consumed by tools to
> know how to fetch and assemble layers for end users. Also includes an
> example of the layer setup that constructs poky/meta-intel/imaginary product layer
> for reference.
>
> The schema can be used to validate a layer setup file with the commands:
>
>  $ python3 -m pip install jsonschema
>  $ jsonschema -i meta/files/layers.example.json meta/files/layers.schema.json
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>
> Alex: I made the following modifications to Joshua's original commit:
>
> - moved the files from meta/lib to meta/files
>
> - the example json showcases a multi-repo, multi-layer setup with additional
> configurations and machines, instead of just poky - closer to a typical product
>
> - the schema is modified so that:
>
> -- all lists (sources, layers, remotes) are replaced by objects keyed by 'name' properties of the list items.
> This allows using them as dicts inside Python, and makes the json more compact and readable.

As long as the order is truly irrelevant because different
implementations (and even different versions of Python!) will result
in a different processing order.

>
> -- added 'contains_this_file' property to source object
>
> -- added 'buildconfigs', 'machines' and 'distros' properties to layer objects.
>
> -- replaced 'remote' property with a 'oneOf' definition for git with a specific
> 'git-remote' property. 'oneOf' is problematic when schema validation fails:
> the diagnostic is only that none of oneOf variants matched, which is too non-specific.
>
> -- added 'describe' property to 'git-remote' object.
>
> FIXME:
> - oe-selftest that validates the example json against the schema using python3-jsonschema-native
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/files/layers.example.json | 115 ++++++++++++++++++++++++++++++
>  meta/files/layers.schema.json  | 125 +++++++++++++++++++++++++++++++++
>  2 files changed, 240 insertions(+)
>  create mode 100644 meta/files/layers.example.json
>  create mode 100644 meta/files/layers.schema.json
>
> diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
> new file mode 100644
> index 0000000000..f606567b9d
> --- /dev/null
> +++ b/meta/files/layers.example.json
> @@ -0,0 +1,115 @@
> +{

Missing the version? Although I see it's in the schema.

> +    "sources": {
> +        "meta-alex": {
> +            "contains_this_file": true,
> +            "git-remote": {

The problem with this is that there has been some desire for other
fetching mechanisms; Perhaps we can say git is only supported, but
that was the reason I used `oneOf`: it allows for other fetching types
in the future.

> +                "branch": "master",
> +                "describe": "",
> +                "remotes": {
> +                    "remote-alex": {
> +                        "uri": "https://github.com/kanavin/meta-alex"
> +                    }

Multiple remotes are nice.... but not strictly necessary, since you
can only have one rev checked out. I don't care too much one way or
another but it's something to think about since it makes the fetching
more complicated.

> +                },
> +                "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
> +            },
> +            "layers": {
> +                "meta-alex": {
> +                    "buildconfigs": {
> +                        "conf/templates/configuration-gadget": {},
> +                        "conf/templates/configuration-gizmo": {}

I think these fall under the same category as the machines below, but
I don't use  TEMPLATECONF so I'm not sure.

> +                    },
> +                    "subpath": ""
> +                }
> +            },
> +            "path": "meta-alex"
> +        },
> +        "meta-intel": {
> +            "git-remote": {
> +                "branch": "master",
> +                "describe": "15.0-hardknott-3.3-310-g0a96edae",
> +                "remotes": {
> +                    "origin": {
> +                        "uri": "git://git.yoctoproject.org/meta-intel"
> +                    }
> +                },
> +                "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
> +            },
> +            "layers": {
> +                "meta-intel": {
> +                    "machines": {
> +                        "intel-core2-32": {},
> +                        "intel-corei7-64": {},
> +                        "intel-skylake-64": {}

Why does this need to be listed here? Isn't this just the contents of
the conf/machine directory in the layer? I really don't want to be
duplicating information; IHMO it's better to let the layer itself be
canonical about what machines/distros/etc. it supports

> +                    },
> +                    "subpath": ""
> +                }
> +            },
> +            "path": "meta-intel"
> +        },
> +        "poky": {
> +            "git-remote": {
> +                "branch": "akanavin/setup-layers",
> +                "describe": "4.1_M1-374-g9dda719b2a",
> +                "remotes": {
> +                    "origin": {
> +                        "uri": "git://git.yoctoproject.org/poky"
> +                    },
> +                    "poky-contrib": {
> +                        "uri": "ssh://git@push.yoctoproject.org/poky-contrib"
> +                    }
> +                },
> +                "rev": "9dda719b2a4727a4d43a6ab8d9e23f8ca68790ec"
> +            },
> +            "layers": {
> +                "meta": {
> +                    "distros": {
> +                        "defaultsetup": {}

Same as machines above

> +                    },
> +                    "machines": {
> +                        "qemuarm": {},
> +                        "qemuarm64": {},
> +                        "qemuarmv5": {},
> +                        "qemumips": {},
> +                        "qemumips64": {},
> +                        "qemuppc": {},
> +                        "qemuppc64": {},
> +                        "qemuriscv32": {},
> +                        "qemuriscv64": {},
> +                        "qemux86": {},
> +                        "qemux86-64": {}
> +                    },
> +                    "subpath": "meta"
> +                },
> +                "meta-poky": {
> +                    "buildconfigs": {
> +                        "conf": {}
> +                    },
> +                    "distros": {
> +                        "poky": {},
> +                        "poky-altcfg": {},
> +                        "poky-bleeding": {},
> +                        "poky-tiny": {}
> +                    },
> +                    "subpath": "meta-poky"
> +                },
> +                "meta-selftest": {
> +                    "machines": {
> +                        "qemux86copy": {}
> +                    },
> +                    "subpath": "meta-selftest"
> +                },
> +                "meta-yocto-bsp": {
> +                    "machines": {
> +                        "beaglebone-yocto": {},
> +                        "edgerouter": {},
> +                        "genericx86": {},
> +                        "genericx86-64": {}
> +                    },
> +                    "subpath": "meta-yocto-bsp"
> +                }
> +            },
> +            "path": "poky"
> +        }
> +    },
> +    "version": "1.0"
> +}
> \ No newline at end of file
> diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
> new file mode 100644
> index 0000000000..ba46e00b52
> --- /dev/null
> +++ b/meta/files/layers.schema.json
> @@ -0,0 +1,125 @@
> +{
> +    "description": "OpenEmbedder Layer Setup Manifest",
> +    "type": "object",
> +    "additionalProperties": false,
> +    "required": [
> +        "version"
> +    ],
> +    "properties": {
> +        "version": {
> +            "description": "The version of this document; currently '1.0'",
> +            "enum": ["1.0"]
> +        },
> +        "sources": {
> +            "description": "The dict of layer sources",
> +            "type": "object",
> +            "patternProperties": { ".*" : {
> +                "type": "object",
> +                "description": "The upstream source from which a set of layers may be fetched",
> +                "additionalProperties": false,
> +                "required": [
> +                    "path"
> +                ],
> +                "properties": {
> +                    "path": {
> +                        "description": "The path where this layer source will be placed when fetching",
> +                        "type": "string"
> +                    },
> +                    "description": {
> +                        "description": "A description of this layer source",
> +                        "type": "string"
> +                    },
> +                    "contains_this_file": {
> +                        "description": "Whether the directory with the layer source also contains this json description. Tools may want to skip the checkout of the source then.",
> +                        "type": "boolean"
> +                    },
> +                    "layers": {
> +                        "description": "The dict of layers to be used from this upstream source",
> +                        "type": "object",
> +                        "patternProperties": { ".*" : {
> +                            "description": "A layer from the upstream source",
> +                            "type": "object",
> +                            "additionalProperties": false,
> +                            "properties": {
> +                                "subpath": {
> +                                    "description": "The subpath (relative to the source root) for this layer. Omit if the source root is the layer path",
> +                                    "type": "string"
> +                                },
> +                                "buildconfigs": {
> +                                    "description": "A dict of template build configurations in the layer, keyed by relative path to the layer root",
> +                                    "type": "object",
> +                                    "patternProperties": { ".*" : {
> +                                        "description": "Properties of a build confuguration template",
> +                                        "type": "object",
> +                                        "additionalProperties": false,
> +                                        "properties":{}
> +                                    }}
> +                                },
> +                                "machines": {
> +                                    "description": "A dict of machine definitions in the layer",
> +                                    "type": "object",
> +                                    "patternProperties": { ".*" : {
> +                                        "description": "Properties of a machine definition",
> +                                        "type": "object",
> +                                        "additionalProperties": false,
> +                                        "properties":{}
> +                                    }}
> +                                },
> +                                "distros": {
> +                                    "description": "A dict of distro definitions in the layer",
> +                                    "type": "object",
> +                                    "patternProperties": { ".*" : {
> +                                        "description": "Properties of a distro definition",
> +                                        "type": "object",
> +                                        "additionalProperties": false,
> +                                        "properties":{}
> +                                    }}
> +                                }
> +                            }
> +                        }}
> +                    },
> +                    "git-remote": {
> +                                "description": "A remote git source from which to fetch",
> +                                "type": "object",
> +                                "additionalProperties": false,
> +                                "required": [
> +                                    "rev"
> +                                ],
> +                                "properties": {
> +                                    "branch": {
> +                                        "description": "The git branch to fetch (optional)",
> +                                        "type": "string"
> +                                    },
> +                                    "rev": {
> +                                        "description": "The git revision to checkout",
> +                                        "type": "string"
> +                                    },
> +                                    "describe": {
> +                                        "description": "The output of 'git describe' (human readable description of the revision using tags in revision history).",
> +                                        "type": "string"
> +                                    },
> +                                    "remotes": {
> +                                        "description": "The dict of git remotes to add to this repository",
> +                                        "type": "object",
> +                                        "patternProperties": { ".*" : {
> +                                            "description": "A git remote",
> +                                            "type": "object",
> +                                            "addtionalProperties": false,
> +                                            "required": [
> +                                                "uri"
> +                                            ],
> +                                            "properties": {
> +                                                "uri": {
> +                                                    "description": "The URI for the remote",
> +                                                    "type": "string"
> +                                                }
> +                                            }
> +                                        }}
> +                                    }
> +                                }
> +                    }
> +                }
> +            }
> +        }}
> +    }
> +}
> --
> 2.30.2
>

